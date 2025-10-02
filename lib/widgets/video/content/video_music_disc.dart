// 视频右下角滚动碟

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/animation/rotating_widget.dart';

class VideoMusicDisc extends StatelessWidget {
  final bool isMusicDiscScrolling;
  final String musicImagePath;
  final VoidCallback onTap;

  const VideoMusicDisc({
    super.key,
    required this.isMusicDiscScrolling,
    required this.musicImagePath,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: RotatingWidget(
        onTap: onTap,
        isPlaying: isMusicDiscScrolling,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            musicImagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
