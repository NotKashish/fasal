import 'package:flutter/material.dart';
import 'package:fasal/widgets/profile_widget.dart';
import 'package:fasal/widgets/textfield_widget.dart';
import 'package:fasal/constants/constants.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: androidGreen,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath:
                'https://i.pinimg.com/originals/0a/6c/ae/0a6caeadd01eb5d9ca8ebb69d71c1fed.jpg',
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextFieldWidget(
            label: 'about',
            onChanged: (about) {},
          ),
        ],
      ),
    );
  }
}

//  NEEDS TO BE WORKED ON AFTER SORTING OUT SHARED PREFERENCES //
