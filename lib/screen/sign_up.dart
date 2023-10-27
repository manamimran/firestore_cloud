import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cloud/src/user_model.dart';
import 'package:flutter/material.dart';

import 'data_display.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final userModel = UserModel;

  // void createUser() {
  //    UserModel(
  //       username: _usernameController.text,
  //       email: _emailController.text,
  //       password: _passwordController.text);
  // }
  //   // Save user data to Firestore using the Firestore package.
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .add(userModel.toJson())
  //       .then((_) {
  //     print("User data saved successfully.");
  //   }).catchError((error) {
  //     print("Error saving user data: $error");
  //   });
  // }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  // You can add more email validation here.
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {
                      'Username': _usernameController.text,
                      'Email': _emailController.text,
                      'Password': _passwordController.text
                    };
                    FirebaseFirestore.instance.collection('users').add(data);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DataDisplayScreen()),
                    );
                  }
                },
                child: Text('Sign Up'),

              )
            ],
          ),
        ),
      ),
    );
  }
}
