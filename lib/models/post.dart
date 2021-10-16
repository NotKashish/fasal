class Post{

  final String postId;
  final String postTitle;
  final String farmerId;
  final String description;
  final String mediaUrl;
  String quality;
  int quantity;

  Post({
    required this.postId,
    required this.postTitle,
    required this.farmerId,
    required this.description,
    required this.mediaUrl,
    this.quantity = 1,
    this.quality = "Average",
  });

}