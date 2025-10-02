// 视频信息中的用户头像

import 'package:flutter/material.dart';

class VideoAction extends StatelessWidget {

  // 头像地址
  final String avatarPath;

  // 点赞数量
  final int likeCount;

  // 评论数量
  final int commentCount;

  // 收藏数量
  final int collectCount;

  // 分享数量
  final int shareCount;

  const VideoAction({
    super.key,
    required this.avatarPath,
    required this.likeCount,
    required this.commentCount,
    required this.collectCount,
    required this.shareCount,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      // color: Colors.red,
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
                  avatarPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 点赞
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.favorite, color: Colors.white, size: 30),
                  SizedBox(height: 2),
                  Text(likeCount.toString(), style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 评论
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.comment, color: Colors.white, size: 28),
                  SizedBox(height: 2),
                  Text(commentCount.toString(), style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 收藏
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.star, color: Colors.white, size: 30),
                  SizedBox(height: 2),
                  Text(collectCount.toString(), style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 分享
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.share, color: Colors.white, size: 28),
                  SizedBox(height: 2),
                  Text(shareCount.toString(), style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 音乐
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 48,
                width: 48,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    avatarPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
