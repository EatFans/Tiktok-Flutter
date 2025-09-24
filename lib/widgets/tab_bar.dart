import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  final Function(int)? onTabSelected;

  const BottomTabBar({super.key, this.onTabSelected});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  // 当前索引
  int currentIndex = 0;

  // 当tab栏被点击
  void _onTabTap(int index) {
    setState(() {
      currentIndex = index; // 更新内部状态
    });
    widget.onTabSelected?.call(index); // 通知父组件
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 80,
        color: const Color(0xFF161616),
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onTabTap(0),
              child: Text(
                "首页",
                style: TextStyle(
                  color: currentIndex == 0 ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTap(1),
              child: Text(
                "商城",
                style: TextStyle(
                  color: currentIndex == 1 ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTap(2),
              child: Container(
                width: 38,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTap(3),
              child: Text(
                "消息",
                style: TextStyle(
                  color: currentIndex == 3 ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTap(4),
              child: Text(
                "我",
                style: TextStyle(
                  color: currentIndex == 4 ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}