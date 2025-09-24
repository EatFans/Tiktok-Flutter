import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/tab_bar.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {

  int _currentTabIndex = 0;

  // 主要页面列表
  List pageList = [
    Container(color: Colors.blue, child: Text("首页")),
    Container(color: Colors.red, child: Text("商城")),
    Container(color: Colors.green, child: Text("消息")),
    Container(color: Colors.yellow, child: Text("我")),
  ];

  void _selectedTabIndex(int index){
    setState(() {
      _currentTabIndex = index;
    });

    print("currentTabIndex:" + _currentTabIndex.toString() + " index: " + index.toString());
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
