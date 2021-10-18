import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ViewFarmers extends StatefulWidget {
  const ViewFarmers({Key? key}) : super(key: key);

  @override
  _ViewFarmersState createState() => _ViewFarmersState();
}

class _ViewFarmersState extends State<ViewFarmers> {
  late CollectionReference collectionReference;

  String region = 'All';
  List<Map<String, dynamic>> farmers = [];

  Future getPosts() async {
    QuerySnapshot qn =
        await collectionReference.where("type", isEqualTo: "farmer").get();
    return qn.docs;
  }

  @override
  void initState() {
    collectionReference = FirebaseFirestore.instance.collection('users');

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Farmers'),
        backgroundColor: oliveGreen,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          DropdownButton<String>(
            value: region,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
            ),
            onChanged: (String? newValue) {
              setState(() {
                farmers.clear();
                region = newValue!;
              });
            },
            items: <String>[
              'All',
              'Maharashtra',
              'Gujarat',
              'Tamil Nadu',
              'Rajasthan',
              'Goa'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          FutureBuilder(
            future: getPosts(),
            builder: (BuildContext _, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Loading...'),
                );
              } else {
                for (var object in snapshot.data) {
                  if (region != "All") {
                    if (object.data()['region'] == region) {
                      farmers.add(object.data());
                      print(object.data()['name']);
                    }
                  } else {
                    farmers.add(object.data());
                  }
                }
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: farmers.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 70,
                            child: Card(
                              elevation: 3,
                              margin: EdgeInsets.all(5),
                              // shadowColor: Colors.black.withOpacity(0.8),
                              color: androidGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  farmers[index]["name"],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 21.0,
                                  ),
                                ),
                                onTap: (null),
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
