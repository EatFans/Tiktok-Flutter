// 视频底部信息栏部分

import 'package:flutter/material.dart';

class VideoInfo extends StatelessWidget {

  final String authorName;

  final String videoTitle;

  const VideoInfo({
    super.key,
    required this.authorName,
    required this.videoTitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 作者名
          Row(
            children: [
              const SizedBox(width: 5),
              Text(
                authorName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              )
            ],
          ),

          // 视频标题信息文本
          Container(
            // color: Colors.green,
            child: Row(
              children: [
                const SizedBox(width: 5),
                Text(
                  videoTitle,
                  style: TextStyle(
                    color: Color(0xFFDAD9D9),
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                  )
                ),


              ],

            ),
          ),

          // 视频进度条


          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
