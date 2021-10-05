import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewFarmers extends StatefulWidget {
  const ViewFarmers({Key? key}) : super(key: key);

  @override
  _ViewFarmersState createState() => _ViewFarmersState();
}

class _ViewFarmersState extends State<ViewFarmers> {
  late CollectionReference collectionReference;

  Future getPosts() async {
    QuerySnapshot qn =
        await collectionReference.where("type", isEqualTo: "wholesaler").get();
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
        title: Text('View'),
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
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.black.withOpacity(0.8),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          title: Text(
                            snapshot.data[index].data()["name"],
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          onTap: (null),
                          leading: Icon(
                            Icons.format_list_numbered,
                            color: Colors.blueGrey,
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
