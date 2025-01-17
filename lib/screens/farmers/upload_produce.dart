import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/helper/shared_preferences_helper.dart';
import 'package:fasal/models/farmer.dart';
import 'package:fasal/services/database_services.dart';
import 'package:fasal/services/storage_services.dart';
import 'package:fasal/widgets/drawer.dart';
import 'package:fasal/widgets/postCard.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:fasal/models/post.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  TextEditingController postTitleController = TextEditingController();
  TextEditingController postDescriptionController = TextEditingController();
  dynamic file;
  bool isUploading = false;
  ImagePicker picker = ImagePicker();
  String postId = Uuid().v4();
  DatabaseService ds = DatabaseService();
  StorageService ss = StorageService();

  @override
  void initState() {
    super.initState();
  }

  handleTakePhoto() async {
    Navigator.pop(context);
    var pickedImage = await picker.getImage(
        source: ImageSource.camera, maxWidth: 960, maxHeight: 675);
    File file = File(pickedImage!.path);
    setState(() {
      this.file = file;
    });
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    var pickedImage = await picker.getImage(
        source: ImageSource.gallery, maxWidth: 960, maxHeight: 675);
    File file = File(pickedImage!.path);
    setState(() {
      this.file = file;
    });
  }

  selectImage(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: [
              SimpleDialogOption(
                child: Text("Photo with Camera"),
                onPressed: handleTakePhoto,
              ),
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: handleChooseFromGallery,
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  Widget buildSplashScreen(){
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SvgPicture.asset('assets/images/upload.svg', height: 260),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => selectImage(context),
                  child: Text("Select an Image"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  clearImage() {
    setState(() {
      //file = null;
    });
  }

  compressImage() async {
    var tempDir = await getTemporaryDirectory();
    var path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync())!;
    File compressedFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedFile;
    });
  }

  Future<String> uploadImage(File file) async {
    TaskSnapshot snapshot =
        await ss.storageRef.child("post_$postId.jpg").putFile(file);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore(
      {required String mediaUrl,
      required String postTitle,
      required String postDescription}) async {
    String farmerUid = (await getUidFromPrefs())!;
    String farmerNo = (await getPhoneFromPrefs())!;
    ds.postsRef.doc(postId).set({
      "postId": postId,
      "farmerId": farmerUid,
      "farmerNo": farmerNo,
      "mediaUrl": mediaUrl,
      "postTitle": postTitle,
      "postDescription": postDescription,
      "date": DateTime.now()
    });
  }

  handleSubmit() async {
    print("handle submit called");
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(file);
    print("mediaUrl: $mediaUrl");
    print("mediaUrlType: ${mediaUrl.runtimeType}");
    print("postDescriptionController.text: ${postDescriptionController.text}");
    print("postTitleController.text: ${postTitleController.text}");
    createPostInFirestore(
        mediaUrl: mediaUrl,
        postDescription: postDescriptionController.text,
        postTitle: postTitleController.text);
    postTitleController.clear();
    postDescriptionController.clear();
    setState(() {
      file = null;
      isUploading = false;
      postId = Uuid().v4();
    });
  }

  Widget buildUploadForm(){
    return Scaffold(
      body: ListView(
        children: [
          isUploading ? LinearProgressIndicator() : Text(""),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(file),
                      )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.title),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: postTitleController,
                decoration: InputDecoration(
                    hintText: "Enter Title",
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.menu_book_outlined),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: postDescriptionController,
                decoration: InputDecoration(
                    hintText: "Enter Description",
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: ElevatedButton(
              child: Text("POST"),
              onPressed: isUploading ? null : () => handleSubmit(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}

class UploadProduce extends StatefulWidget {
  const UploadProduce({Key? key}) : super(key: key);

  @override
  _UploadProduceState createState() => _UploadProduceState();
}

class _UploadProduceState extends State<UploadProduce> {

  String userId = "";
  late Future<List> postsListFuture;
  List postsList = [];
  DatabaseService ds = DatabaseService();
  late CollectionReference postsReference;

  getData() async {
    getUidFromPrefs().then((value){
      setState(() {
        userId = value!;
      });
      print("userId: $userId");
      setState(() {
        postsListFuture = ds.getPostsByUserId(userId);
      });
    });
  }

  Future getPosts() async {
    String? uid = "rPmtQmrmelg8EYDFXX9b2jGn8Jz2";
    uid = await getUidFromPrefs();
    print("uid: $uid");
    QuerySnapshot qn =
    await postsReference.where("farmerId", isEqualTo: uid).get();
    return qn.docs;
  }
  
  @override
  void initState() {
    getData();
    print("userId: $userId");
    postsReference = FirebaseFirestore.instance.collection('posts');
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Produce'),
        backgroundColor: mayGreen,
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return UploadPage();
          }));
        },
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getPosts(),
          builder: (context, AsyncSnapshot snapshot){
            print("snapshot in FB: ${snapshot.data}");
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.connectionState == ConnectionState.done && snapshot.data!=null){
              return Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      print("snapshot: ${snapshot.data[index]}");
                      //return Container(child: Text("text"),);
                      return PostCard(post: Post.fromDocument(snapshot.data![index]));
                    }
                ),
              );
            }
            else{
              return Center(
                child: Text("No Posts yet"),
              );
            }
          },
        ),
      )
    );
  }
}
