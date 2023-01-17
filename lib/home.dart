import 'package:firebaseauth/authentication.dart';
import 'package:firebaseauth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Text("Welcome")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          AuthenticationHelper().signOut().then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => Login()))
            ));
        }
        ),
        child: Icon(Icons.logout),
        tooltip: "Logout"),
    );
    
  }

}