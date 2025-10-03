
// 视频数据实体对象

class VideoItemModel {
  // 视频路径
  final String videoPath;

  // 视频作者名字
  final String authorName;

  // 视频标题
  final String videoTitle;

  // 音乐封面
  final String musicCover;

  // 头像路径
  final String avatarPath;

  // 点赞数量
  final int likeCount;

  // 评论数量
  final int commentCount;

  // 收藏数量
  final int collectCount;

  // 分享数量
  final int shareCount;

  VideoItemModel({
    required this.videoPath,
    required this.authorName,
    required this.videoTitle,
    required this.musicCover,
    required this.avatarPath,
    required this.likeCount,
    required this.commentCount,
    required this.collectCount,
    required this.shareCount
  });

}