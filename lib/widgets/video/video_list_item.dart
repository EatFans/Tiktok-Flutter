
// 视频列表物品部件
// 一个视频列表物品部件主要含有三部分
// 1、视频播放器主体
// 2、视频信息部分
// 3、视频操作部分

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/models/video_item_model.dart';
import 'package:tiktok_flutter/widgets/video/content/video_action.dart';
import 'package:tiktok_flutter/widgets/video/content/video_info.dart';
import 'package:tiktok_flutter/widgets/video/content/video_music_disc.dart';
import 'package:tiktok_flutter/widgets/video/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {

  final VideoPlayerController videoPlayerController;

  final VideoItemModel videoItem;

  // 当前项是否处于激活（可见且应当播放）状态
  final bool isActive;

  const VideoListItem({
    super.key,
    required this.videoPlayerController,
    required this.videoItem,
    required this.isActive,
  });

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {

  bool _isShowVideoPauseButton = false;

  bool _isMusicDiscScrolling = false;

  late final VoidCallback _controllerListener;
  // 是否允许自动播放（手动暂停会关闭；重新激活时恢复）
  bool _allowAutoPlay = true;

  // 初始化
  @override
  void initState() {
    _controllerListener = () {
      final isPlaying = widget.videoPlayerController.value.isPlaying;
      final isInitialized = widget.videoPlayerController.value.isInitialized;
      setState(() {
        // 暂停时显示播放按钮覆盖，播放时隐藏
        _isShowVideoPauseButton = !isPlaying;
        // 只有播放时音乐盘旋转
        _isMusicDiscScrolling = isPlaying;
      });

      // 若刚初始化完成且当前项为激活项，且允许自动播放，则自动播放
      if (isInitialized && widget.isActive && !isPlaying && _allowAutoPlay) {
        widget.videoPlayerController.setVolume(1.0);
        widget.videoPlayerController.setLooping(true);
        widget.videoPlayerController.play();
      }
    };

    widget.videoPlayerController.addListener(_controllerListener);
    // 根据激活状态，决定是否自动播放
    _applyActiveState();
    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayerController.removeListener(_controllerListener);
    super.dispose();
  }

  // 暂停视频
  void pauseVideo(){
    if (widget.videoPlayerController.value.isPlaying){
      // 先关闭自动播放，再执行暂停，避免监听器抢先触发自动播放
      _allowAutoPlay = false;
      widget.videoPlayerController.pause();
      print("暂停视频");
    } else {
      // 确保基本播放参数
      if (widget.videoPlayerController.value.isInitialized) {
        widget.videoPlayerController.setVolume(1.0);
        widget.videoPlayerController.setLooping(true);
      }
      // 先打开自动播放，再执行播放，使监听器中的自动播放逻辑一致
      _allowAutoPlay = true;
      widget.videoPlayerController.play();
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
            authorName: widget.videoItem.authorName,
            videoTitle: widget.videoItem.videoTitle,
          )
        ),

        // 视频操作部分
        Positioned(
          right: 0,
          bottom: 80 + 70,
          child: VideoAction(
            avatarPath: widget.videoItem.avatarPath,
            likeCount: widget.videoItem.likeCount,
            commentCount: widget.videoItem.commentCount,
            collectCount: widget.videoItem.collectCount,
            shareCount: widget.videoItem.shareCount,
          )
        ),

        // 视频音乐音频部分
        Positioned(
          right: 4,
          bottom: 90,
          child: VideoMusicDisc(
            onTap: () {
              print("音乐盘被点击");
            },
            isMusicDiscScrolling: _isMusicDiscScrolling,
            musicImagePath: widget.videoItem.musicCover,
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

  // 根据激活状态应用播放/暂停
  void _applyActiveState() {
    final c = widget.videoPlayerController;
    if (!c.value.isInitialized) {
      // 未初始化时不做处理，待初始化完成后由父组件或手势触发播放
      return;
    }
    if (widget.isActive) {
      c.setVolume(1.0);
      c.setLooping(true);
      if (!c.value.isPlaying) {
        if (_allowAutoPlay) c.play();
      }
    } else {
      if (c.value.isPlaying) {
        c.pause();
      }
    }
  }

  @override
  void didUpdateWidget(covariant VideoListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) {
      // 重新变为激活项时恢复自动播放策略（满足“切回自动播放”）
      if (widget.isActive) {
        _allowAutoPlay = true;
      }
      _applyActiveState();
    }
  }
}
