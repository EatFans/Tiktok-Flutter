// 竖屏视频播放器

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VerticalVideoPlayer extends StatelessWidget {

  final VideoPlayerController videoPlayerController;

  const VerticalVideoPlayer({
    super.key,
    required this.videoPlayerController
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final videoSize = videoPlayerController.value.size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: videoSize.width,
          height: videoSize.height,
          child: VideoPlayer(videoPlayerController),
        ),
      ),
    );
  }
}
