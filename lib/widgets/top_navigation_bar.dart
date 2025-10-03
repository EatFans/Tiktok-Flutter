// 顶部导航栏部件

import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> categories;

  const TopNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.categories
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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

              const SizedBox(width: 15),

              // 视频分类区域
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  child: Row(
                    textDirection: TextDirection.rtl, // 从右到左顺序
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(categories.length, (index) {
                      final isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                categories[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.white70,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold
                                )
                              ),

                              const SizedBox(height: 4),

                              // 下方白色指示条
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 2,
                                width: isSelected ? 20 : 0,
                                color: Colors.white
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ),

              const SizedBox(width: 10),

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
    );
  }
}
