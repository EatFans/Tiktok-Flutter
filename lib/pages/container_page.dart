import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/tab_bar.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {

  // Tab页面索引
  int _currentTabIndex = 0;

  // 主要页面列表
  final List<Widget> _pageList = [
    Container(color: Colors.blue, child: Center(child: Text("首页"))),
    Container(color: Colors.red, child: Center(child: Text("商城"))),
    Container(color: Colors.green, child: Center(child: Text("消息"))),
    Container(color: Colors.yellow, child: Center(child: Text("我"))),
  ];

  // 选择tab，将当前索引设置选择的tab物品的索引
  void _selectedTabIndex(int index){
    setState(() {
      _currentTabIndex = index;
    });
    print("currentTabIndex:$_currentTabIndex index: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 主内容区域
          // 因为底部Tab栏使用Position部件，这里主内容区域使用Positioned.fill占满其余空间
          Positioned.fill(
            child: IndexedStack(
              index: _currentTabIndex,
              children: _pageList,
            ),
          ),
          // 底部Tab栏
          // 分装好的，内部最外层为Position部分
          BottomTabBar(
            onTabSelected: (index) => _selectedTabIndex(index),
          )
        ],
      ),
    );
  }
}
