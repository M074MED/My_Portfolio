import '../../core/layout/adaptive.dart';
import 'widgets/animated_footer.dart';
import 'widgets/page_header.dart';
import '../widgets/animated_line_through_text.dart';
import '../widgets/animated_positioned_text.dart';
import '../widgets/animated_text_slide_box_transition.dart';
import '../widgets/content_area.dart';
import '../widgets/content_builder.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/page_wrapper.dart';
import '../widgets/spaces.dart';
import '../../values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/utils/functions.dart';

class ExperiencePage extends StatefulWidget {
  static const String experiencePageRoute = StringConst.EXPERIENCE_PAGE;
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<AnimationController> _experienceControllers;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _experienceControllers = List.generate(
      Data.experienceData.length,
      (_) => AnimationController(
        duration: const Duration(milliseconds: 1200),
        vsync: this,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    for (final controller in _experienceControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
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
        assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
      ),
    );

    return PageWrapper(
      selectedRoute: ExperiencePage.experiencePageRoute,
      selectedPageName: StringConst.EXPERIENCE,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.EXPERIENCE,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildExperienceSection(
                  data: Data.experienceData,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceSection({
    required List<ExperienceData> data,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_18,
        Sizes.TEXT_SIZE_20,
      ),
    );
    TextStyle? positionStyle = defaultTitleStyle?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_18,
      ),
      fontWeight: FontWeight.w300,
    );

    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      final List<PositionData> positions = data[index].positions;
      final bool hasMultiplePositions = positions.length > 1;
      items.add(
        VisibilityDetector(
          key: Key('experience-section-$index'),
          onVisibilityChanged: (visibilityInfo) {
            double visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 40) {
              _experienceControllers[index].forward();
            }
          },
          child: ContentBuilder(
            controller: _experienceControllers[index],
            number: "/0${index + 1}",
            width: width,
            section: data[index].duration.toUpperCase(),
            heading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedLineThroughText(
                  onTap: () {
                    if (data[index].companyUrl != null &&
                        data[index].companyUrl != "") {
                      Functions.launchLink(data[index].companyUrl!);
                    }
                  },
                  hasSlideBoxAnimation: true,
                  hasOffsetAnimation: true,
                  isUnderlinedOnHover: false,
                  controller: _experienceControllers[index],
                  text: data[index].company,
                  textStyle: defaultTitleStyle,
                ),
                if (!hasMultiplePositions) ...[
                  SpaceH16(),
                  AnimatedTextSlideBoxTransition(
                    controller: _experienceControllers[index],
                    text: positions.first.position,
                    textStyle: positionStyle,
                  ),
                ],
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: hasMultiplePositions
                  ? _buildPositions(
                      positions: positions,
                      positionStyle: positionStyle,
                      controller: _experienceControllers[index],
                      width: width * 0.75,
                    )
                  : _buildRoles(
                      roles: positions.first.roles,
                      controller: _experienceControllers[index],
                      width: width * 0.75,
                    ),
            ),
          ),
        ),
      );
      items.add(
        CustomSpacer(heightFactor: 0.1),
      );
    }

    return items;
  }

  List<Widget> _buildRoles({
    required List<String> roles,
    required AnimationController controller,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        17,
      ),
      color: AppColors.grey750,
      fontWeight: FontWeight.w300,
      height: 1.5,
      // letterSpacing: 2,
    );

    List<Widget> items = [];
    for (int index = 0; index < roles.length; index++) {
      items.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow_outlined,
              color: AppColors.black,
              size: 12,
            ),
            SpaceW8(),
            Flexible(
              child: AnimatedPositionedText(
                text: roles[index],
                textStyle: bodyText1Style,
                maxLines: 7,
                width: width,
                controller: CurvedAnimation(
                  parent: controller,
                  curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                ),
              ),
            ),
          ],
        ),
      );

      items.add(SpaceH12());
    }

    return items;
  }

  List<Widget> _buildPositions({
    required List<PositionData> positions,
    required TextStyle? positionStyle,
    required AnimationController controller,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? durationStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.grey600,
      fontWeight: FontWeight.w400,
      letterSpacing: 2,
    );

    List<Widget> items = [];
    for (int index = 0; index < positions.length; index++) {
      final PositionData position = positions[index];
      items.add(
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: position.position,
          textStyle: positionStyle,
        ),
      );
      items.add(SpaceH8());
      items.add(
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: position.duration.toUpperCase(),
          textStyle: durationStyle,
        ),
      );
      items.add(SpaceH16());
      items.addAll(
        _buildRoles(
          roles: position.roles,
          controller: controller,
          width: width,
        ),
      );
      if (index != positions.length - 1) {
        items.add(SpaceH30());
      }
    }

    return items;
  }
}
