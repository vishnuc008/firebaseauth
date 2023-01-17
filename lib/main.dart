import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args)async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(title: "FLUTTER AUTH DEMO",home: Login(),debugShowCheckedModeBanner: false,);
  }

}