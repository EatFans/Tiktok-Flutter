import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/tab_bar.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {

  int _currentTabIndex = 0;

  void _selectedTabIndex(int index){
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 主内容区域
          IndexedStack(
            children: [
              Container(
                color: Colors.red,
              )
            ],
          ),

          // 底部Tab栏
          BottomTabBar(
            onTabSelected: (index) => _selectedTabIndex(index),
          )
        ],
      ),
    );
  }
}
