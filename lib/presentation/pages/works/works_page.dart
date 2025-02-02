import '../../../core/layout/adaptive.dart';
import '../../../core/utils/functions.dart';
import '../../widgets/loading_slider.dart';
import '../widgets/animated_footer.dart';
import 'widgets/noteworthy_projects.dart';
import '../widgets/page_header.dart';
import '../../widgets/custom_spacer.dart';
import '../../widgets/page_wrapper.dart';
import '../../widgets/project_item.dart';
import '../../../values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WorksPage extends StatefulWidget {
  static const String worksPageRoute = StringConst.WORKS_PAGE;
  const WorksPage({Key? key}) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _headingTextController;
  late AnimationController forwardSlideController;
  Duration duration = Duration(milliseconds: 1250);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _headingTextController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    forwardSlideController = AnimationController(
      vsync: this,
      duration: duration,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _headingTextController.dispose();
    forwardSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double projectItemHeight = assignHeight(context, 0.4);
    double subHeight = (3 / 4) * projectItemHeight;
    double extra = projectItemHeight - subHeight;

    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
      ),
    );
    return Stack(
      children: [
        PageWrapper(
          selectedRoute: WorksPage.worksPageRoute,
          selectedPageName: StringConst.WORKS,
          navBarAnimationController: _headingTextController,
          hasSideTitle: false,
          onLoadingAnimationDone: () {
            _headingTextController.forward();
          },
          imagesToPreload: [
            ...Data.projects.map((project) => project.image).toList(),
          ],
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              PageHeader(
                headingText: StringConst.WORKS,
                headingTextController: _headingTextController,
              ),
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  double screenWidth = sizingInformation.screenSize.width;

                  if (screenWidth <= RefinedBreakpoints().tabletSmall) {
                    return Column(
                      children: _buildProjectsForMobile(
                        data: Data.projects,
                        projectHeight: projectItemHeight.toInt(),
                        subHeight: subHeight.toInt(),
                      ),
                    );
                  } else {
                    return Container(
                      height: (subHeight * (Data.projects.length)) + extra,
                      child: Stack(
                        children: _buildProjects(
                          data: Data.projects,
                          projectHeight: projectItemHeight.toInt(),
                          subHeight: subHeight.toInt(),
                        ),
                      ),
                    );
                  }
                },
              ),
              CustomSpacer(heightFactor: 0.1),
              Container(
                child: Padding(
                  padding: padding,
                  child: NoteWorthyProjects(),
                ),
              ),
              CustomSpacer(heightFactor: 0.15),
              AnimatedFooter(),
            ],
          ),
        ),
        LoadingSlider(
          controller: forwardSlideController,
          width: widthOfScreen(context),
          height: heightOfScreen(context),
        ),
      ],
    );
  }

  List<Widget> _buildProjects({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];
    int margin = subHeight * (data.length - 1);

    for (int index = data.length - 1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItemLg(
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].image,
            projectItemheight: projectHeight.toDouble(),
            subheight: subHeight.toDouble(),
            backgroundColor: AppColors.accentColor2.withOpacity(0.35),
            title: data[index].title,
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () {
              forwardSlideController.forward();
              forwardSlideController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Functions.navigateToProject(
                    context: context,
                    dataSource: data,
                    currentProject: data[index],
                    currentProjectIndex: index,
                  );
                  Future.delayed(Duration(milliseconds: 500), () {
                    forwardSlideController.reset();
                  });
                }
              });
            },
          ),
        ),
      );
      margin -= subHeight;
    }
    return items;
  }

  List<Widget> _buildProjectsForMobile({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        Container(
          child: ProjectItemSm(
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].image,
            title: data[index].title,
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () {
              forwardSlideController.forward();
              forwardSlideController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Functions.navigateToProject(
                    context: context,
                    dataSource: data,
                    currentProject: data[index],
                    currentProjectIndex: index,
                  );
                  Future.delayed(Duration(milliseconds: 500), () {
                    forwardSlideController.reset();
                  });
                }
              });
            },
          ),
        ),
      );
      items.add(CustomSpacer(
        heightFactor: 0.10,
      ));
    }
    return items;
  }
}
