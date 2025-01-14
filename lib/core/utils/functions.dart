import 'dart:developer';

import '../../presentation/pages/project_detail/project_detail_page.dart';
import '../../presentation/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'toast_message.dart';

class Functions {
  static Future<void> launchLink(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        log('Could not launch $url');
        ToastMessage(message: 'Could not launch $url', bgColor: Colors.red)
            .show();
      }
    } catch (e) {
      log(e.toString());
      ToastMessage(message: e.toString(), bgColor: Colors.red).show();
    }
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  static void navigateToProject({
    required BuildContext context,
    required List<ProjectItemData> dataSource,
    required ProjectItemData currentProject,
    required int currentProjectIndex,
  }) {
    Navigator.of(context).pushNamed(
      ProjectDetailPage.generateRoute(currentProject.projectId),
      arguments: ProjectDetailArguments(
        dataSource: dataSource,
        currentIndex: currentProjectIndex,
        data: currentProject,
        nextProject: currentProjectIndex < dataSource.length - 1
            ? dataSource[currentProjectIndex + 1]
            : null,
        hasNextProject: currentProjectIndex < dataSource.length - 1,
      ),
    );
  }

  static Future<void> preloadImages(BuildContext context, List<String> imageUrls) async {
    for (String imageUrl in imageUrls) {
      await precacheImage(AssetImage(imageUrl), context);
    }
  }
}
