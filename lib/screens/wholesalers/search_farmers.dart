import 'package:fasal/constants/constants.dart';
import 'package:fasal/widgets/drawer.dart';
import 'package:flutter/material.dart';

class SearchFarmers extends StatefulWidget {
  const SearchFarmers({Key? key}) : super(key: key);

  @override
  _SearchFarmersState createState() => _SearchFarmersState();
}

class _SearchFarmersState extends State<SearchFarmers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: mayGreen,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('hame'),
      ),
    );
  }
}
