import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasal/constants/constants.dart';
import 'package:flutter/material.dart';

class ViewFarmers extends StatefulWidget {
  const ViewFarmers({Key? key}) : super(key: key);

  @override
  _ViewFarmersState createState() => _ViewFarmersState();
}

class _ViewFarmersState extends State<ViewFarmers> {
  late CollectionReference collectionReference;

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
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Helpful stuff of course'),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext _, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
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
                        color: oliveGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            snapshot.data[index].data()["name"],
                            style: TextStyle(
                              color: Colors.white,
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
            );
          }
        },
      ),
    );
  }
}
