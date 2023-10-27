import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cloud/screen/sign_up.dart';
import 'package:firestore_cloud/src/user_model.dart';
import 'package:flutter/material.dart';


class DataDisplayScreen extends StatefulWidget {
  @override
  State<DataDisplayScreen> createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {

  DeleteData(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            print('Data enter successfully');
            final docs = snapshot.data!.docs;
            var list = List.generate(
                docs.length, (index) => UserModel.fromMap(docs[index].data()));
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return SingleChildScrollView(
                  child: Container(
                    child: ListTile(
                      title: Text('Username: ${item.username}'),
                      subtitle:
                      Column(
                        children: <Widget>[
                          Text('Email: ${item.email}'),
                          Text('Password: ${item.password}'),
                          ElevatedButton(
                              onPressed: (){
                                  print("Data deleted");
                                  DeleteData(docs[index].id);
                          }, child: Text('Delete')),

                        ],
                      ),
                      // Text('Email: ${item.email}'),
                      // leading: Icon(Icons.delete),
                      // onTap: (){
                      //   print("On Tap is fired");
                      //   DeleteData(docs[index].id);
                      // },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        },
        child: const Icon(Icons.add),
      ),


    );
  }
}
