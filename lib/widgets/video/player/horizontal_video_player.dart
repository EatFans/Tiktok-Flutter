// 横屏视频播放器
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HorizontalVideoPlayer extends StatelessWidget {

  final VideoPlayerController videoPlayerController;

  const HorizontalVideoPlayer({
    super.key,
    required this.videoPlayerController
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final videoSize = videoPlayerController.value.size;
    final videoAspectRatio = videoSize.width / videoSize.height;

    return Container(
      width: screenSize.width,
      height: (screenSize.width / videoAspectRatio) * 0.8,
      color: Colors.black,
      child: VideoPlayer(videoPlayerController),
    );
  }
}
