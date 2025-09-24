import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  final Function(int)? onTabSelected;

  const BottomTabBar({super.key, this.onTabSelected});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  // 当前索引
  int _currentIndex = 0;



  // 当tab栏被点击
  void _onTabTap(int index) {
    setState(() {
      _currentIndex = index; // 更新内部状态
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
        color: _currentIndex == 0 ? Color(0xFF161616) : Colors.white,
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onTabTap(0),
              child: Text(
                "首页",
                style: TextStyle(
                  color: _currentIndex == 0 ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTap(1),
              child: Text(
                "商城",
                style: TextStyle(
                  color: _currentIndex == 1 ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 中间发布按钮
            GestureDetector(
              onTap: () => _onTabTap(-1),
              child: Container(
                width: 38,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _currentIndex == 0 ? Colors.white : Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.add,
                  color: _currentIndex == 0 ? Colors.white : Colors.black,
                  size: 25,
                ),
              ),
            ),


            GestureDetector(
              onTap: () => _onTabTap(2),
              child: Text(
                "消息",
                style: TextStyle(
                  color: _currentIndex == 2 ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTap(3),
              child: Text(
                "我",
                style: TextStyle(
                  color: _currentIndex == 3 ? Colors.black : Colors.grey,
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