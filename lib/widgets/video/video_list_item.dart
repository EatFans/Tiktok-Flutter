
// 视频列表物品部件
// 一个视频列表物品部件主要含有三部分
// 1、视频播放器主体
// 2、视频信息部分
// 3、视频操作部分

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/video/video_player_widget.dart';

class VideoListItem extends StatefulWidget {

  final String videoPath;

  const VideoListItem({
    super.key,
    required this.videoPath
  });

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {

  late String _videoPath;

  // 初始化
  @override
  void initState() {
    super.initState();
    _videoPath = widget.videoPath;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 视频播放器主体
        Positioned.fill(
          child: Container(
            color: Colors.black,
            child: VideoPlayerWidget(videoPath: _videoPath),
          )
        ),

        // 视频信息部分
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            // color: Colors.red,
            color: Colors.transparent
          ),
        ),

        // 视频操作部分
        Positioned(
          right: 0,
          bottom: 80 + 80,
          child: Container(
            width: 60,
            height: 400,
            // color: Colors.green,
            color: Colors.transparent
          ),
        ),
      ],
    );
  }
}
