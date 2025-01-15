import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:visibility_detector/visibility_detector.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoPath;

  const CustomVideoPlayer({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isFinished = false;
  bool _showControls = true;
  Timer? _hideTimer;

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showControls = false);
    });
  }

  void _handleTap() {
    setState(() => _showControls = true);
    _startHideTimer();
  }

  void _handleHover() {
    setState(() => _showControls = true);
    _startHideTimer();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
          _isPlaying = true;
          _startHideTimer();
        }
      });

    _controller.addListener(() {
      if (mounted) {
        setState(() {
          _isFinished =
              _controller.value.position >= _controller.value.duration;
        });
      }
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _handlePlayPause() {
    setState(() {
      if (_isFinished) {
        _controller.seekTo(Duration.zero);
        _controller.play();
        _isFinished = false;
        _isPlaying = true;
      } else if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
    _startHideTimer();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? VisibilityDetector(
            key: Key(widget.videoPath), // Unique key for each video
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction == 0) {
                setState(() {
                  _controller.pause();
                  _isPlaying = false;
                });
              }
            },
            child: MouseRegion(
              onHover: (_) => _handleHover(),
              child: GestureDetector(
                onTap: _handleTap,
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    AnimatedOpacity(
                      opacity: _showControls ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                            onPressed: _handlePlayPause,
                            icon: Icon(
                              _isFinished
                                  ? Icons.replay
                                  : _isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        padding: const EdgeInsets.only(bottom: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
