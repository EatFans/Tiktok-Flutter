import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tiktok_flutter/widgets/video/video_list_item.dart';
import 'package:video_player/video_player.dart';

// 视频播放推荐选项的主体部分
//
// 这里需要控制视频播放
class MainVideoPlayContent extends StatefulWidget {
  const MainVideoPlayContent({super.key});

  @override
  State<MainVideoPlayContent> createState() => _MainVideoPlayContentState();
}

class _MainVideoPlayContentState extends State<MainVideoPlayContent> {

  // 视频控制器类列表
  final List<VideoPlayerController> _videoPlayerControllerList = [
    VideoPlayerController.asset("assets/video/test1.mp4"),
    VideoPlayerController.asset("assets/video/test2.mp4"),
    VideoPlayerController.asset("assets/video/test3.mp4"),
    VideoPlayerController.asset("assets/video/test4.mp4"),
    VideoPlayerController.asset("assets/video/test5.mp4"),
    VideoPlayerController.asset("assets/video/test6.mp4"),
    VideoPlayerController.asset("assets/video/test7.mp4"),
    VideoPlayerController.asset("assets/video/test8.mp4"),
    VideoPlayerController.asset("assets/video/test9.mp4"),
  ];

  final List<String> _videoList = [
    "assets/video/test1.mp4",
    "assets/video/test2.mp4",
    "assets/video/test3.mp4",
    "assets/video/test4.mp4",
    "assets/video/test5.mp4",
    "assets/video/test6.mp4",
    "assets/video/test7.mp4",
    "assets/video/test8.mp4",
    "assets/video/test9.mp4",
  ];

  int _currentVideoPlayerContainerIndex = 0;


  Future<void> initializeAllVideoControllers() async {
    try {
      await Future.wait(
          _videoPlayerControllerList.map((controller) => controller.initialize())
      );
      print("所有视频控制器初始化完成");
    } catch (e) {
      print("视频控制器初始化失败: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    initializeAllVideoControllers().then((_) {
      print("所有视频初始化完毕");
      _videoPlayerControllerList[0].setVolume(1.0);
      _videoPlayerControllerList[0].setLooping(true);
      _videoPlayerControllerList[0].play();
      print("播放视频");
      setState(() {

      });
    });

  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      // 垂直方向滚动
        scrollDirection: Axis.vertical,
        itemCount: _videoList.length,
        itemBuilder: (context, index) {
          return VideoListItem(
            videoPlayerController: _videoPlayerControllerList[index],
          );
        }
    );
  }
}

