import 'package:flutter/material.dart';
import 'package:tiktok_flutter/models/video_item_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // 视频缓存数据列表
  List<VideoItemModel> tempVideoItemList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            // 视频主体
            Positioned.fill(
              child: Container(
                color: Colors.blue,
                child: Text("首页"),
              ),
            ),

            // 顶部操作栏部分
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 90,
                // color: Colors.transparent,
                color: Colors.yellow,
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

            // 视频信息部分
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                color: Colors.red,
              ),
            ),

            // 视频操作部分
            Positioned(
              right: 0,
              bottom: 80 + 80,
              child: Container(
                width: 60,
                height: 400,
                color: Colors.green,
              ),
            ),
          ],
        )
    );
  }
}
