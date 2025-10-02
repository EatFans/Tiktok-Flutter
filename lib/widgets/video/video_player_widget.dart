import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/video/player/horizontal_video_player.dart';
import 'package:tiktok_flutter/widgets/video/player/vertical_video_player.dart';
import 'package:video_player/video_player.dart';

// 视频播放器组件
class VideoPlayerWidget extends StatefulWidget {


  final VideoPlayerController videoPlayerController;


  const VideoPlayerWidget({
    super.key,
    required this.videoPlayerController,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  // 视频播放控制器
  late VideoPlayerController _videoPlayerController;

  bool isLoading = true;


  // 初始化状态
  @override
  void initState() {
    super.initState();
    _videoPlayerController = widget.videoPlayerController;
    setState(() {
      isLoading = false;
    });
  }

  // 处置状态
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    // 视频原始尺寸
    final videoSize = _videoPlayerController.value.size;
    // 屏幕尺寸
    final screenSize = MediaQuery.of(context).size;
    // 长宽比
    final videoAspectRatio = videoSize.width / videoSize.height;

    return Container(
      width: screenSize.width,
      color: Colors.transparent,
      child: Center(
        // 长款
          child: videoAspectRatio >= 1 ? HorizontalVideoPlayer(videoPlayerController: _videoPlayerController) : VerticalVideoPlayer(videoPlayerController: _videoPlayerController)
      ),
    );
  }
}
