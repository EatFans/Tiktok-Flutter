
// 视频列表物品部件
// 一个视频列表物品部件主要含有三部分
// 1、视频播放器主体
// 2、视频信息部分
// 3、视频操作部分

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/home/video_info_avatar.dart';
import 'package:tiktok_flutter/widgets/video/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {

  final VideoPlayerController videoPlayerController;

  const VideoListItem({
    super.key,
    required this.videoPlayerController
  });

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {


  // 初始化
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // TODO: 将视频点击相关操作移动到这里进行操作处理

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 视频播放器主体
        Positioned.fill(
          child: Container(
            color: Colors.black,
            child: VideoPlayerWidget(
              videoPlayerController: widget.videoPlayerController,
            ),
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
            // color: Colors.transparent,

          ),
        ),

        // 视频操作部分
        Positioned(
          right: 0,
          bottom: 80 + 80,
          child: VideoInfoAvatar()
        ),
      ],
    );
  }
}
