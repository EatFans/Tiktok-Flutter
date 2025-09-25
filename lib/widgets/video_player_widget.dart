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
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        _playVideo();
      });
  }

  // 播放视频
  void _playVideo(){
    _videoPlayerController.setVolume(1.0);
    _videoPlayerController.play();
    _videoPlayerController.setLooping(true);
  }

  // 暂停视频
  void pauseVideo(){
    setState(() {
      _videoPlayerController.pause();
    });
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
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: _videoPlayerController.value.size.width,
        height: _videoPlayerController.value.size.height,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}
