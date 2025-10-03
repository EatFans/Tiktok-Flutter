
// 视频数据实体对象
import 'package:video_player/video_player.dart';

class VideoItemModel {

  final VideoPlayerController videoPlayerController;

  final String avatarPath;

  final int likeCount;

  final int commentCount;

  final int collectCount;

  final int shareCount;

  VideoItemModel({
    required this.videoPlayerController,
    required this.avatarPath,
    required this.likeCount,
    required this.commentCount,
    required this.collectCount,
    required this.shareCount,
  });
}