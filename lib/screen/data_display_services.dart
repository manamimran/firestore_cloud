import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cloud/src/user_model.dart';

class DataService {

  // //store user in firestore
  // final _db = FirebaseFirestore.instance;
  // createUser(UserModel userModel) async {
  //   await _db.collection('users').add(userModel.toJson());
  // }

  ///fetch all data fromm firestore
  // Future<List<UserModel>> allUsers() async {
  //   final snapshot = await _db.collection('users').get();
  //   final userData =
  //       snapshot.docs.map((e) => UserModel.fromSnapdhot(e)).toList();
  //   return userData;
  // }
}
