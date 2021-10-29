import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Post.fromDocument(DocumentSnapshot doc){
    Map postData = doc.data() as Map;
    print("inside post model: $postData");
    return Post(
        postId: postData['postId'],
      postTitle: postData['postTitle'],
      farmerId: postData['farmerId'],
      description: postData['postDescription'],
      mediaUrl: postData['mediaUrl']
    );
  }

}