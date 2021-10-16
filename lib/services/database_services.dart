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

  Future<List> getAllPosts(String userId) async {
    QuerySnapshot snapshot = await postsRef.where('userId',isEqualTo: userId).get();
    List<Post> postsList = [];
    snapshot.docs.forEach((doc) {
      Map data = doc.data() as Map;
      postsList.add(
          Post.fromDocument(doc)
      );
    });
    return postsList;
  }

}