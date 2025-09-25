import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {

  final String videoUrl;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  // 视频播放控制器
  late VideoPlayerController _videoPlayerController;

  // 初始化状态
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/video/test2.mp4')
      ..initialize().then((_) {
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
    if (_videoPlayerController.value.isPlaying){
      _videoPlayerController.pause();
      print("暂停视频");
    } else {
      _videoPlayerController.play();
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
    if (!_videoPlayerController.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    final videoSize = _videoPlayerController.value.size; // 视频原始尺寸
    final screenSize = MediaQuery.of(context).size;

    final videoAspectRatio = videoSize.width / videoSize.height;

    return GestureDetector(
      onTap: pauseVideo,
      child: Center(
        child: videoAspectRatio >= 1
        // 横屏视频
          ? Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                width: screenSize.width,
                height: (screenSize.width / videoAspectRatio) * 0.8,
                color: Colors.black,
                child: VideoPlayer(_videoPlayerController),
              ),
          )
        // 竖屏视频
            : Container(
          width: screenSize.width,
          height: screenSize.height,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: videoSize.width,
              height: videoSize.height,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        ),
      ),
    );
  }
}
