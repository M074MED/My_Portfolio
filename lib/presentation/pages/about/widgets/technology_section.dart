import '../../../widgets/animated_positioned_text.dart';
import '../../../widgets/animated_text_slide_box_transition.dart';
import '../../../widgets/spaces.dart';
import '../../../../values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double spacing = 24;
const double runSpacing = 40;

class TechnologySection extends StatelessWidget {
  const TechnologySection({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          RefinedBreakpoints breakpoints = RefinedBreakpoints();

          // Scale the number of category columns up with the screen size.
          int columns;
          if (screenWidth < breakpoints.tabletNormal) {
            columns = 2; // mobile
          } else if (screenWidth < breakpoints.desktopSmall) {
            columns = 3; // tablet / small laptop
          } else if (screenWidth < breakpoints.desktopLarge) {
            columns = 4; // desktop
          } else {
            columns = 6; // large desktop — all categories on one row
          }

          double columnWidth =
              (width - (spacing * (columns - 1))) / columns;

          return Wrap(
            spacing: spacing,
            runSpacing: runSpacing,
            children: Data.technologyCategories
                .map(
                  (category) => _buildCategory(
                    context,
                    category: category,
                    width: columnWidth,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context, {
    required TechCategory category,
    required double width,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.black,
    );

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextSlideBoxTransition(
            controller: controller,
            width: width,
            maxLines: 2,
            text: category.title,
            textStyle: titleStyle,
          ),
          SpaceH20(),
          ..._buildTechnologies(
            context,
            data: category.skills,
            controller: controller,
            width: width,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTechnologies(
    BuildContext context, {
    required List<String> data,
    required AnimationController controller,
    required double width,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_15,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
    );
    List<Widget> items = [];
    for (var item in data) {
      items.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: width,
            child: AnimatedPositionedText(
              controller: CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.6,
                  1.0,
                  curve: Curves.ease,
                ),
              ),
              width: width,
              maxLines: 2,
              text: item,
              textStyle: bodyText1Style,
            ),
          ),
        ),
      );
    }

    return items;
  }
}
