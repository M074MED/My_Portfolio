import '../../../core/layout/adaptive.dart';
import '../../../core/utils/functions.dart';
import '../../widgets/loading_slider.dart';
import 'widgets/about_project.dart';
import 'widgets/next_project.dart';
import '../widgets/simple_footer.dart';
import '../../widgets/animated_text_slide_box_transition.dart';
import '../../widgets/animated_wave.dart';
import '../../widgets/content_area.dart';
import '../../widgets/custom_spacer.dart';
import '../../widgets/empty.dart';
import '../../widgets/page_wrapper.dart';
import '../../widgets/project_item.dart';
import '../../widgets/spaces.dart';
import '../../../values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../widgets/custom_video_player.dart';

class ProjectDetailArguments {
  final ProjectItemData data;
  final List<ProjectItemData> dataSource;
  final int currentIndex;
  final ProjectItemData? nextProject;
  final bool hasNextProject;

  ProjectDetailArguments({
    required this.dataSource,
    required this.data,
    required this.currentIndex,
    required this.hasNextProject,
    this.nextProject,
  });
}

class ProjectDetailPage extends StatefulWidget {
  static const String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;
  final String? projectId;

  ProjectDetailPage({Key? key, this.projectId}) : super(key: key);

  static String generateRoute(String projectId) {
    return '$projectDetailPageRoute/$projectId';
  }

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _waveController;
  late AnimationController _aboutProjectController;
  late AnimationController _projectDataController;
  late AnimationController forwardSlideController;
  Duration duration = Duration(milliseconds: 1250);
  ProjectDetailArguments? projectDetails;
  double waveLineHeight = 100;

  @override
  void initState() {
    _waveController = AnimationController(
      vsync: this,
      duration: Animations.waveDuration,
    )..repeat();
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _aboutProjectController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationShort,
    );
    _waveController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _waveController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _waveController.forward();
      }
    });
    _projectDataController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationShort,
    );
    _waveController.forward();
    forwardSlideController = AnimationController(
      vsync: this,
      duration: duration,
    );
    super.initState();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _aboutProjectController.dispose();
    _controller.dispose();
    forwardSlideController.dispose();
    super.dispose();
  }

  _getArguments() {
    if (projectDetails != null) {
      return;
    }

    String? id = widget.projectId;
    if (id == null) {
      id = ModalRoute.of(context)!.settings.name!.split('/').last;
    }
    // Find project by ID
    final project = Data.projects.firstWhere(
      (p) => p.projectId == id,
      orElse: () => Data.projects.first,
    );

    final currentIndex = Data.projects.indexOf(project);
    final hasNextProject = currentIndex < Data.projects.length - 1;

    projectDetails = ProjectDetailArguments(
      dataSource: Data.projects,
      data: project,
      currentIndex: currentIndex,
      hasNextProject: hasNextProject,
      nextProject: hasNextProject ? Data.projects[currentIndex + 1] : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    _getArguments();
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? coverTitleStyle = textTheme.displayMedium?.copyWith(
      color: AppColors.white,
      fontSize: 40,
    );
    TextStyle? coverSubtitleStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.white,
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.25),
      ),
    );
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.60),
      assignWidth(context, 0.80),
    );
    return Stack(
      children: [
        PageWrapper(
          backgroundColor: AppColors.white,
          selectedRoute: ProjectDetailPage.projectDetailPageRoute,
          hasSideTitle: false,
          selectedPageName: StringConst.PROJECT,
          navBarAnimationController: _controller,
          navBarTitleColor: projectDetails!.data.navTitleColor,
          navBarSelectedTitleColor: projectDetails!.data.navSelectedTitleColor,
          appLogoColor: projectDetails!.data.appLogoColor,
          onLoadingAnimationDone: () {
            _controller.forward();
          },
          imagesToPreload: [
            projectDetails!.data.coverUrl,
            ...projectDetails!.data.projectAssets
                .where((asset) => !asset.endsWith('.mp4')),
            if (projectDetails!.hasNextProject &&
                projectDetails!.nextProject != null)
              projectDetails!.nextProject!.image,
          ],
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              Container(
                width: widthOfScreen(context),
                height: heightOfScreen(context),
                child: Stack(
                  children: [
                    Image.asset(
                      projectDetails!.data.coverUrl,
                      fit: BoxFit.cover,
                      width: widthOfScreen(context),
                      height: heightOfScreen(context),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: waveLineHeight + 40),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedTextSlideBoxTransition(
                              controller: _controller,
                              widthFactor: 1.20,
                              text: "${projectDetails!.data.title}.",
                              coverColor: projectDetails!.data.primaryColor,
                              textStyle: coverTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                            SpaceH20(),
                            AnimatedTextSlideBoxTransition(
                              controller: _controller,
                              widthFactor: 1.20,
                              text: projectDetails!.data.subtitle,
                              coverColor: projectDetails!.data.primaryColor,
                              textStyle: coverSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedWaveLine(
                          height: waveLineHeight,
                          controller: _waveController,
                          color: projectDetails!.data.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomSpacer(heightFactor: 0.15),
              VisibilityDetector(
                key: Key('about-project'),
                onVisibilityChanged: (visibilityInfo) {
                  double visiblePercentage =
                      visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage > 40) {
                    _aboutProjectController.forward();
                  }
                },
                child: Padding(
                  padding: padding,
                  child: ContentArea(
                    width: contentAreaWidth,
                    child: Aboutproject(
                      projectData: projectDetails!.data,
                      controller: _aboutProjectController,
                      projectDataController: _projectDataController,
                      width: contentAreaWidth,
                    ),
                  ),
                ),
              ),
              CustomSpacer(heightFactor: 0.10),
              ..._buildProjectAlbum(projectDetails!.data.projectAssets),
              projectDetails!.hasNextProject
                  ? CustomSpacer(heightFactor: 0.15)
                  : Empty(),
              projectDetails!.hasNextProject
                  ? Padding(
                      padding: padding,
                      child: ContentArea(
                        width: contentAreaWidth,
                        child: NextProject(
                          width: contentAreaWidth,
                          nextProject: projectDetails!.nextProject!,
                          navigateToNextProject: () {
                            forwardSlideController.forward();
                            forwardSlideController.addStatusListener((status) {
                              if (status == AnimationStatus.completed) {
                                Functions.navigateToProject(
                                  context: context,
                                  dataSource: projectDetails!.dataSource,
                                  currentProject: projectDetails!.nextProject!,
                                  currentProjectIndex:
                                      projectDetails!.currentIndex + 1,
                                );
                                Future.delayed(Duration(milliseconds: 500), () {
                                  forwardSlideController.reset();
                                });
                              }
                            });
                          },
                        ),
                      ),
                    )
                  : Empty(),
              projectDetails!.hasNextProject
                  ? CustomSpacer(heightFactor: 0.15)
                  : Empty(),
              SimpleFooter(),
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

  List<Widget> _buildProjectAlbum(List<String> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        data[index].endsWith('.mp4')
            ? CustomVideoPlayer(videoPath: data[index])
            : Image.asset(
                data[index],
                fit: BoxFit.cover,
              ),
      );
    }

    return items;
  }
}
