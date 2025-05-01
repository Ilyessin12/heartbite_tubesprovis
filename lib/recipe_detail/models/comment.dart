class Comment {
  final String id;
  final String userName;
  final String userImageUrl;
  final String text;
  final String timeAgo;
  bool isLiked;
  int likeCount;
  
  Comment({
    required this.id,
    required this.userName,
    required this.userImageUrl,
    required this.text,
    required this.timeAgo,
    this.isLiked = false,
    required this.likeCount,
  });
}