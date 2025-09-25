import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/video/horizontal_video_player.dart';
import 'package:tiktok_flutter/widgets/video/vertical_video_player.dart';
import 'package:video_player/video_player.dart';

// 视频播放器组件
class VideoPlayerWidget extends StatefulWidget {

  final String videoPath;

  const VideoPlayerWidget({
    super.key,
    required this.videoPath
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  // 视频播放控制器
  late VideoPlayerController _videoPlayerController;


  bool isLoading = true;

  bool isVideoPause = false;

  // 初始化状态
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          isLoading = false;
        });
        _playVideo();
      });
  }

  // 播放视频
  void _playVideo(){
    _videoPlayerController.setVolume(1.0);
    _videoPlayerController.play();
    _videoPlayerController.setLooping(true);
    print("播放视频");
  }

  // 暂停视频
  void pauseVideo(){
    if (_videoPlayerController.value.isPlaying && !isVideoPause){
      _videoPlayerController.pause();

      setState(() {
        isVideoPause = true;
      });

      print("暂停视频");
    } else {
      _videoPlayerController.play();

      setState(() {
        isVideoPause = false;
      });

      print("继续播放");
    }
  }

  // 处置状态
  @override
  void dispose() {
    _videoPlayerController.dispose();
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

    return Stack(
      children: [
        // 视频显示区域为底部
        GestureDetector(
          onTap: pauseVideo,
          child: Container(
            width: screenSize.width,
            color: Colors.transparent,
            child: Center(
                child: videoAspectRatio >= 1 ? HorizontalVideoPlayer(videoPlayerController: _videoPlayerController) : VerticalVideoPlayer(videoPlayerController: _videoPlayerController)
            ),
          ),
        ),

        // 暂停图标
        if (isVideoPause)
          Align(
            child: GestureDetector(
              onTap: pauseVideo,
              child: Icon(
                Icons.play_arrow_rounded,
                size: 80,
                color: Colors.white54,
              ),
            ),
          )


      ]
    );
  }
}
