import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'fetch_current_user_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future login() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
          .then((value) {
         print("Successfully Login");
         Fluttertoast.showToast(msg: "Successfully Login");
         Navigator.push(context, MaterialPageRoute(builder: (context)=> FetchCurrentUserData()));
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "Failed Login");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text("Login Screen", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter Your Email", hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Email", labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.email, color: Colors.black,),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Enter Your Password", hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Password", labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.lock, color: Colors.black,),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: MaterialButton(
                color: Colors.deepOrangeAccent,
                shape: StadiumBorder(),
                onPressed: (){
                  login();
                },
                child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
