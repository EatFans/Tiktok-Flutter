import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tiktok_flutter/models/video_item_model.dart';
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

  // 页面控制器（用于监听页面切换）
  final PreloadPageController _pageController = PreloadPageController(initialPage: 0);

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

  // 初始化指定索引的视频控制器（仅当未初始化时）
  Future<void> _initController(int index) async {
    try {
      final controller = _videoPlayerControllerList[index];
      if (!controller.value.isInitialized) {
        await controller.initialize();
      }
    } catch (e) {
      print("视频控制器（$index）初始化失败: $e");
    }
  }

  // 预初始化邻居页，提升翻页体验
  Future<void> _preloadNeighbors(int index) async {
    final neighbors = <int>{index - 1, index + 1}
        .where((i) => i >= 0 && i < _videoPlayerControllerList.length)
        .toList();
    for (final i in neighbors) {
      await _initController(i);
    }
  }

  // 播放指定索引视频，并确保只有该视频在播放
  void _playIndex(int index) {
    // 播放控制迁移到 VideoListItem，通过 isActive 控制
    _currentVideoPlayerContainerIndex = index;
    setState(() {});
    print("激活索引: $index");
  }

  // 页面切换时的处理：暂停旧的，初始化并播放新的
  Future<void> _handlePageChanged(int newIndex) async {
    print("页面切换到: $newIndex");
    // 初始化新的
    await _initController(newIndex);
    _playIndex(newIndex);
    // 预初始化相邻页
    await _preloadNeighbors(newIndex);
  }

  @override
  void initState() {
    super.initState();
    // 仅初始化并播放当前页，同时预加载邻居页
    _initController(0).then((_) {
      _playIndex(0);
      _preloadNeighbors(0);
    });

  }

  @override
  void dispose() {
    // 释放所有控制器
    for (final c in _videoPlayerControllerList) {
      c.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      // 垂直方向滚动
        controller: _pageController,
        preloadPagesCount: 1,
        onPageChanged: (index) {
          _handlePageChanged(index);
        },
        scrollDirection: Axis.vertical,
        itemCount: _videoList.length,
        itemBuilder: (context, index) {
          return VideoListItem(
            videoPlayerController: _videoPlayerControllerList[index],
            isActive: index == _currentVideoPlayerContainerIndex,
            videoItem: VideoItemModel(
                videoPath: _videoList[index],
                authorName: "测试",
                videoTitle: "这是一条测试视频信息标题文案",
                musicCover: "https://picx.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_720w.jpg",
                avatarPath: "https://picx.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_720w.jpg",
                likeCount: 3213,
                commentCount: 235,
                collectCount: 78,
                shareCount: 32
            ),
          );
        }
    );
  }
}

