import 'package:flutter/material.dart';
import 'package:tiktok_flutter/widgets/video/video_player_widget.dart';

// 视频播放推荐选项的主体部分
class MainVideoPlayContent extends StatefulWidget {
  const MainVideoPlayContent({super.key});

  @override
  State<MainVideoPlayContent> createState() => _MainVideoPlayContentState();
}

class _MainVideoPlayContentState extends State<MainVideoPlayContent> {

  List<Widget> videoList = [

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 视频主体播放器
        Positioned.fill(
          child: Container(
            color: Colors.black,
            child: VideoPlayerWidget(videoUrl: "https://v26-web-prime.douyinvod.com/video/tos/cn/tos-cn-ve-15c000-ce/owBXYOhPV2ShzDGI1QiiWC4anDE6vOLAUAM9V/?a=6383&ch=0&cr=0&dr=0&er=0&cd=0%7C0%7C0%7C0&cv=1&br=810&bt=810&cs=2&ds=6&ft=_-iaryTkRR0sLOC3NDy2Nc.xBiGNbL5eW~dU_4mdoKdJNv7TGW&mime_type=video_mp4&qs=0&rc=M2dpOzhkaGdlZWQzOTtpZkBpM3JyaXQ5cjY4NTMzbGkzNEAuXmFjYjU1XjExNTRjXzAtYSNeM140MmRrMXBhLS1kLWJzcw%3D%3D&btag=80000e00010000&cquery=100b&dy_q=1758762133&expire=1758765754&feature_id=b61bfa6d16bcc992d4977edf8a8aad3e&l=202509250902137F6CF5E2B6A2EE0EDF1C&ply_type=4&policy=4&signature=42e5575bcd57c2d515d1b88d9a8e3f81&tk=webid&webid=94323c0887b37f94f50ac5417d2d415b74fcf5f1106c230e40c326c63b00b663da74c2055204bb3842249e84e8997d8e9e753a17f9530d354fdd997f319c7c461eaf786907a3e980bc1e4c983d213a8a76bcc9f74e5c5482e97f4db07c9286fa376b2eebcc51f2109f9320dfca3569e39ff28bc8c58c73e44fafb59bdc26f924ab6e29601e9db7be8e44023f2a5327dd55a2aaa4a055d5b69c2005ce51d88367-db2a615b403aaccfbfae2666eeceb56f"),
          ),
        ),

        // 视频信息部分
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Container(
              height: 80,
              color: Colors.red,
              // color: Colors.transparent
          ),
        ),

        // 视频操作部分
        Positioned(
          right: 0,
          bottom: 80 + 80,
          child: Container(
              width: 60,
              height: 400,
              color: Colors.green,
              // color: Colors.transparent
          ),
        ),
      ],
    );
  }
}

