// 视频信息中的用户头像

import 'package:flutter/material.dart';

class VideoInfoAction extends StatelessWidget {


  const VideoInfoAction({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Center(
        child: Column(
          children: [
            // 头像
            SizedBox(
              width: 52,
              height: 52,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://picx.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_720w.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 点赞
            GestureDetector(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(Icons.favorite, color: Colors.white, size: 30),
                  SizedBox(height: 2),
                  Text("1324", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 评论
            GestureDetector(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(Icons.comment, color: Colors.white, size: 28),
                  SizedBox(height: 2),
                  Text("322", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 收藏
            GestureDetector(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(Icons.star, color: Colors.white, size: 30),
                  SizedBox(height: 2),
                  Text("220", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 分享
            GestureDetector(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(Icons.share, color: Colors.white, size: 28),
                  SizedBox(height: 2),
                  Text("61", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
