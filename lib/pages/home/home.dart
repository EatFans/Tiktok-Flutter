import 'package:flutter/material.dart';
import 'package:tiktok_flutter/models/video_item_model.dart';
import 'package:tiktok_flutter/pages/home/main_video_play_content.dart';
import 'package:tiktok_flutter/widgets/top_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // 主页页面主题部分
  // 根据顶部分类栏选择的索引进行变化，不是固定变
  final List<Widget> _pageContent = [
    MainVideoPlayContent(),
  ];

  int _pageContentIndex = 0;

  final List<String> _categories = [
    "推荐","关注","朋友","同城","团购","长视频","直播","热点","经验"
  ];

  // 视频缓存数据列表
  List<VideoItemModel> tempVideoItemList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            _pageContent[_pageContentIndex],

            // 顶部操作栏部分
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: TopNavigationBar(
                selectedIndex: _pageContentIndex,
                categories: _categories,
              ),
            ),
          ],
        )
    );
  }
}
