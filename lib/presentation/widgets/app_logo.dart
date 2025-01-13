import '../../values/values.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';
import 'page_wrapper.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.title = "M074MED",
    this.titleColor = AppColors.black,
    this.titleStyle,
    this.fontSize = 40,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          HomePage.homePageRoute,
          arguments: NavigationArguments(
            showUnVeilPageAnimation: true,
          ),
        );
      },
      child: Text(
        title,
        style: titleStyle ??
            textTheme.displayMedium?.copyWith(
              color: titleColor,
              fontSize: fontSize,
            ),
      ),
    );
  }
}
