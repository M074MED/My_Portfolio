import '../../core/layout/adaptive.dart';
import '../../core/utils/functions.dart';
import 'widgets/page_header.dart';
import '../widgets/certification_card.dart';
import '../widgets/content_area.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/page_wrapper.dart';
import '../../values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'widgets/animated_footer.dart';

class CertificationPage extends StatefulWidget {
  static const String certificationPageRoute = StringConst.CERTIFICATION_PAGE;
  const CertificationPage({Key? key}) : super(key: key);

  @override
  _CertificationPageState createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage>
    with TickerProviderStateMixin {
  late List<AnimationController> _certificationControllers;
  late AnimationController _headingTextController;

  @override
  void initState() {
    _certificationControllers = List.generate(
      Data.certificationData.length,
      (_) => AnimationController(
        duration: Animations.slideAnimationDurationShort,
        vsync: this,
      ),
    );
    _headingTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  @override
  void dispose() {
    _headingTextController.dispose();
    for (final controller in _certificationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = assignWidth(context, 0.05);
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.7),
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
        assignWidth(context, 0.15),
        sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        sm: assignWidth(context, 0.10),
      ),
    );
    return PageWrapper(
      selectedRoute: CertificationPage.certificationPageRoute,
      selectedPageName: StringConst.CERTIFICATIONS,
      navBarAnimationController: _headingTextController,
      onLoadingAnimationDone: () {
        _headingTextController.forward();
      },
      imagesToPreload: [
        ...Data.certificationData.map((cert) => cert.image).toList(),
      ],
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.CERTIFICATIONS,
            headingTextController: _headingTextController,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: assignWidth(context, 0.05),
                runSpacing: assignHeight(context, 0.02),
                children: _certificateList(
                  data: Data.certificationData,
                  width: contentAreaWidth,
                  spacing: spacing,
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _certificateList({
    required List<CertificationData> data,
    required double width,
    required double spacing,
  }) {
    List<Widget> widgets = [];

    for (var i = 0; i < data.length; i++) {
      widgets.add(
        VisibilityDetector(
          key: Key('certification-$i'),
          onVisibilityChanged: (visibilityInfo) {
            double visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 10) {
              _certificationControllers[i].forward();
            }
          },
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(
              CurvedAnimation(
                parent: _certificationControllers[i],
                curve: Curves.easeIn,
              ),
            ),
            child: CertificationCard(
              imageUrl: data[i].image,
              onTap: () => _viewCertificate(data[i].url),
              title: data[i].title,
              subtitle: data[i].awardedBy,
              actionTitle: StringConst.VIEW,
              isMobileOrTablet: isDisplayMobileOrTablet(context) ? true : false,
              height: isDisplayMobile(context)
                  ? assignHeight(context, 0.20)
                  : assignHeight(context, 0.45),
              width: isDisplayMobile(context)
                  ? assignWidth(
                      context,
                      0.8,
                    )
                  : (width - spacing) / 2,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  void _viewCertificate(String url) {
    Functions.launchLink(url);
  }
}
