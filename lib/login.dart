import 'package:firebaseauth/authentication.dart';
import 'package:firebaseauth/home.dart';
import 'package:firebaseauth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        const SizedBox(
          height: 80,
        ),
        Column(
          children: [
            FlutterLogo(
              size: 55,

            ),
            SizedBox(height: 50),
            Text("Welcome back!",style: TextStyle(fontSize: 24),)
          ],
        ),
        SizedBox(height: 50),
        Padding(padding: EdgeInsets.all(16),
        child: LoginForm(),
        ),
        const SizedBox(height: 20),
        Row(children:<Widget> [
        const SizedBox(width: 30),
        const Text("New here ?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:((context) => Signup())));
          },
          child:const Text("Get registered now!!",style: TextStyle(fontSize: 20,color: Colors.blue),),
        )
        ],)
      ],
    ),
  );
  }

}
class LoginForm extends StatefulWidget{
  LoginForm({Key?key}):super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formkey=GlobalKey<FormState>();
  String ?email;
  String?password;
  bool obscureText=true;

  @override
  Widget build(BuildContext context) {
   return Form(key: formkey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          labelText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100)))
        ),
        validator: (value) {
          if(value!.isEmpty){
            return "please enter some text";
          }
          return null;
        },
        onSaved: ((newValue) {
         email=newValue;

        }
      )
     ) ,
     SizedBox(height: 20),
     TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
        suffixIcon: GestureDetector(onTap: () {
          setState(() {
            obscureText=!obscureText;
          });
          
        },
        child: Icon(obscureText?Icons.visibility_off:Icons.visibility),)
      ),
      obscureText: obscureText,
      onSaved: ((newValue) {
        password=newValue;
      }
      ),
      validator: (value) {
        if(value!.isEmpty){
          return("Please enter some text");
        }
        return null;
      },
     ),
     SizedBox(height: 30),
     SizedBox(
      height: 54,
      width: 184,
      child: ElevatedButton(onPressed:
       (() {
         if(formkey.currentState!.validate()){
          formkey.currentState!.save();
          AuthenticationHelper().signIn(email: email!, password: password!).then((result){
            if(result==null){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Home())));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("result",style: TextStyle(fontSize: 16),)));
            }
          });
         }
         
       }
       ),
       style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24)))),
        child: Text("Login",style: TextStyle(fontSize: 24),)),
     )
     ],
    ));
  }
}