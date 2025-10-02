
// 视频列表物品部件
// 一个视频列表物品部件主要含有三部分
// 1、视频播放器主体
// 2、视频信息部分
// 3、视频操作部分

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/home/video_action.dart';
import 'package:tiktok_flutter/widgets/home/video_info.dart';
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

  bool _isShowVideoPauseButton = false;

  // 初始化
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 暂停视频
  void pauseVideo(){
    if (widget.videoPlayerController.value.isPlaying){
      widget.videoPlayerController.pause();
      setState(() {
        _isShowVideoPauseButton = true;
      });
      print("暂停视频");
    } else {
      widget.videoPlayerController.play();
      setState(() {
        _isShowVideoPauseButton = false;
      });
      print("继续播放");
    }
  }

  // 点赞视频
  void like(){
    print("双击点赞");
  }

  // 加速视频播放倍速
  void accelerateVideoPlay(){
    print("长摁加速视频播放");
  }

  // 停止视频加速，恢复正常播放速度
  void stopAccelerateVideoPlay() {
    print("停止加速视频播放，恢复正常速度");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 视频播放器主体
        Positioned.fill(
          child: GestureDetector(
            onTap: pauseVideo,
            onDoubleTap: like,
            onLongPress: accelerateVideoPlay,
            onLongPressEnd: (details) {
              stopAccelerateVideoPlay();
            },
            child: Container(
              color: Colors.black,
              child: VideoPlayerWidget(
                videoPlayerController: widget.videoPlayerController,
              ),
            ),
          )
        ),

        // 视频信息部分
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: VideoInfo(

          )
        ),

        // 视频操作部分
        Positioned(
          right: 0,
          bottom: 80 + 15,
          child: VideoAction(
            avatarPath: "https://picx.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_720w.jpg",
            likeCount: 1234,
            commentCount: 234,
            collectCount: 221,
            shareCount: 43,
          )
        ),

        if (_isShowVideoPauseButton)
          Align(
            child:GestureDetector(
              onTap: pauseVideo,
              child: Icon(
                Icons.play_arrow_rounded,
                size: 80,
                color: Colors.white54,
              ),
            ),
          )
      ],
    );
  }
}
