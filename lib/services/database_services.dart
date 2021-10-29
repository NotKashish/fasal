import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasal/models/post.dart';

class DatabaseService{

  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  var usersRef = FirebaseFirestore.instance.collection("users");
  var postsRef = FirebaseFirestore.instance.collection("posts");

  getUserById(String id) async {
    DocumentSnapshot doc = await usersRef.doc(id).get();
    return doc;
  }

  Future<List> getPostsByUserId(String userId) async {
    print("method called with user id: $userId");
    QuerySnapshot snapshot = await postsRef.where('farmerId',isEqualTo: userId).get();
    print("snapshot obtained: ${snapshot.docs}");
    List<Post> postsList = [];
    snapshot.docs.forEach((doc) {
      Map data = doc.data() as Map;
      print("post data: $data");
      postsList.add(
          Post.fromDocument(doc)
      );
    });
    print("final postsList: $postsList");
    return postsList;
  }

}