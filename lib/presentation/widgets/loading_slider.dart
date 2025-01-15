import '../../values/values.dart';
import '../../core/utils/functions.dart';
import 'package:flutter/material.dart';

class LoadingSlider extends AnimatedWidget {
  LoadingSlider({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    this.curve = Curves.fastLinearToSlowEaseIn,
    this.isSlideForward = true,
    this.color = AppColors.black,
    this.onLoadingDone,
    this.imagesToPreload = const [],
  }) : super(key: key, listenable: controller);

  final AnimationController controller;
  final Curve curve;
  final double width;
  final double height;
  final Color color;
  final bool isSlideForward;
  final VoidCallback? onLoadingDone;
  final List<String> imagesToPreload;

  Animation<double> get forwardSlideAnimation => Tween<double>(
        begin: 0,
        end: width,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: curve,
        ),
      );

  Animation<double> get backwardsSlideAnimation => Tween<double>(
        begin: width,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: curve,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _LoadingSliderContent(
      controller: controller,
      height: height,
      width: width,
      isSlideForward: isSlideForward,
      color: color,
      forwardSlideAnimation: forwardSlideAnimation,
      backwardsSlideAnimation: backwardsSlideAnimation,
      onLoadingDone: onLoadingDone,
      imagesToPreload: imagesToPreload,
    );
  }
}

class _LoadingSliderContent extends StatefulWidget {
  final AnimationController controller;
  final double height;
  final double width;
  final bool isSlideForward;
  final Color color;
  final Animation<double> forwardSlideAnimation;
  final Animation<double> backwardsSlideAnimation;
  final VoidCallback? onLoadingDone;
  final List<String> imagesToPreload;

  const _LoadingSliderContent({
    required this.controller,
    required this.height,
    required this.width,
    required this.isSlideForward,
    required this.color,
    required this.forwardSlideAnimation,
    required this.backwardsSlideAnimation,
    this.onLoadingDone,
    this.imagesToPreload = const [],
  });

  @override
  _LoadingSliderContentState createState() => _LoadingSliderContentState();
}

class _LoadingSliderContentState extends State<_LoadingSliderContent> {
  bool _imagesLoaded = false;
  bool _animationPaused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadImages();
    });
    if (widget.imagesToPreload.isNotEmpty) {
      // Pause animation at 90% until images are loaded
      widget.controller.addListener(_handleAnimation);
    } else {
      _imagesLoaded = true;
    }
  }

  void _handleAnimation() {
    if (widget.controller.value >= 0.9 && !_imagesLoaded && !_animationPaused) {
      _animationPaused = true;
      widget.controller.stop();
    } else if (_imagesLoaded && _animationPaused) {
      _animationPaused = false;
      widget.controller.forward();
    }
  }

  Future<void> _preloadImages() async {
    await Functions.preloadImages(context, widget.imagesToPreload)
        .then((value) {
      if (mounted) {
        setState(() {
          _imagesLoaded = true;
        });
        // Resume animation if it was paused
        if (_animationPaused) {
          widget.controller.forward();
        }
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleAnimation);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        if (widget.controller.status == AnimationStatus.completed &&
            _imagesLoaded &&
            widget.onLoadingDone != null) {
          widget.onLoadingDone!();
        }

        return Container(
          height: widget.height,
          width: widget.isSlideForward
              ? widget.forwardSlideAnimation.value
              : widget.backwardsSlideAnimation.value,
          color: widget.color,
        );
      },
    );
  }
}
