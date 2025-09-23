import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 主内容区域
          IndexedStack(

          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              color: Color(0xFF161616),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      "首页",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                      "商城",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Container(
                    width: 38,
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25
                    )
                  ),

                  Text(
                      "消息",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                      "我",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
