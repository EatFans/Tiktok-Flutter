import 'package:flutter/material.dart';
import 'package:tiktok_flutter/models/video_item_model.dart';
import 'package:tiktok_flutter/pages/home/main_video_play_content.dart';

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
              child: Container(
                height: 90,
                color: Colors.transparent,
                // color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 抽屉开关按钮
                        GestureDetector(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
                            children: [
                              Container(
                                width: 20,   // 最长
                                height: 2,
                                color: Colors.white,
                                margin: EdgeInsets.only(bottom: 3),
                              ),
                              Container(
                                width: 15,   // 中等
                                height: 2,
                                color: Colors.white,
                                margin: EdgeInsets.only(bottom: 3),
                              ),
                              Container(
                                width: 8,   // 最短
                                height: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),

                        // 视频分类区域
                        Expanded(child: Container()),

                        // 搜索按钮
                        GestureDetector(
                          child: Icon(
                              Icons.search,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              size: 28
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
