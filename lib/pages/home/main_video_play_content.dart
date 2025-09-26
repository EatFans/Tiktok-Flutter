import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tiktok_flutter/widgets/video/video_list_item.dart';
import 'package:tiktok_flutter/widgets/video/video_player_widget.dart';

// 视频播放推荐选项的主体部分
class MainVideoPlayContent extends StatefulWidget {
  const MainVideoPlayContent({super.key});

  @override
  State<MainVideoPlayContent> createState() => _MainVideoPlayContentState();
}

class _MainVideoPlayContentState extends State<MainVideoPlayContent> {

  final List<String> _videoList = [
    "assets/video/test1.mp4",
    "assets/video/test2.mp4",
    "assets/video/test3.mp4",
    "assets/video/test4.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      // 垂直方向滚动
      scrollDirection: Axis.vertical,
      itemCount: _videoList.length,
      itemBuilder: (context, index) {
        return VideoListItem(
          videoPath: _videoList[index],
        );
      }
    );
  }
}

