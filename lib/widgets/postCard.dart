import 'package:fasal/constants/constants.dart';
import 'package:fasal/models/post.dart';
import 'package:fasal/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostCard extends StatefulWidget {

  Post post;
  PostCard({required this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10),
      height: 352,
      width: 368,
      decoration: BoxDecoration(
          color: white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [containerShadow]
      ),
      child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: NetworkImage(this.widget.post.mediaUrl),
                      fit: BoxFit.contain,
                      height: 236,
                    ),
                  ),
                  Text(
                    this.widget.post.postTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    this.widget.post.description,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      '40.0',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 14,
                right: 19,
                child: Icon(
                    Icons.favorite_border_outlined
                )
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: (){
                  launch(
                    ('tel: +91${this.widget.post.farmerNo}'),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 1),
                      color: Theme.of(context).cardColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("CONTACT", style: Theme.of(context).textTheme.headline6,),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.message,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

