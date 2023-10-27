import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late String username;
  late String email;
  late String password;

  UserModel(
      {this.id,
      required this.username,
      required this.email,
      required this.password});

  UserModel.fromMap(Map<String, dynamic> data) {
    id = "";
    username = data['Username'];
    email = data['Email'];
    password = data['Password'];
  }
  toJson() {
    //we store data in the form of JSON in firestore
    return {"Username": username, "Email": email, "Password": password};
  }
}
