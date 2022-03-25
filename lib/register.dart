import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:retrievecurrentuserdata/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  // Register User
  Future register() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await FirebaseAuth.instance.currentUser;
    try{
      auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
          .then((SignedInUser) {
        FirebaseFirestore.instance.collection("Services").doc(SignedInUser.user?.uid).set({
          "Username": nameController.text,
          "Email": emailController.text,
          "Password":  passwordController.text,
          "Mobile Number": mobileNumberController.text,
          "Profession": professionController.text,
          "Address": addressController.text,
        }).then((SignedInUser) => {
          print("Success"),
          Fluttertoast.showToast(msg: "Success"),
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
        });
      });
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "Not Successfully Registered");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text("Register Screen", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Your Username", hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Username", labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.email, color: Colors.black,),
                ),
              ),
            ),
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: mobileNumberController,
                decoration: InputDecoration(
                  hintText: "Enter Your Mobile Number", hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Mobile Number", labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.lock, color: Colors.black,),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: professionController,
                decoration: InputDecoration(
                  hintText: "Enter Your Profession", hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Profession", labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.work_outline, color: Colors.black,),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: "Enter Your Address", hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Address", labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.location_on, color: Colors.black,),
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
                  register();
                },
                child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
