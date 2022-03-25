import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FetchCurrentUserData extends StatefulWidget {
  const FetchCurrentUserData({Key? key}) : super(key: key);

  @override
  State<FetchCurrentUserData> createState() => _FetchCurrentUserDataState();
}

class _FetchCurrentUserDataState extends State<FetchCurrentUserData> {

  String name = "Loading.....";
  String email = "Loading....";
  String mobileNumber = "Loading....";
  String profession = "Loading....";
  String address = "Loading....";

  void getData() async{
    User? user = await FirebaseAuth.instance.currentUser;
    var variable = await FirebaseFirestore.instance.collection("Services").doc(user?.uid).get();

    setState(() {
      name = variable.data()!['Username'];
      email = variable.data()!['Email'];
      mobileNumber = variable.data()!['Mobile Number'];
      profession = variable.data()!['Profession'];
      address = variable.data()!['Address'];
    });
  }

@override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Fetch Current User Data", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 100,),
            Container(
              height: 60,
             margin: EdgeInsets.symmetric(horizontal: 15),
             decoration: BoxDecoration(
               color: Colors.orange,
               borderRadius: BorderRadius.circular(30)
             ),
             child: Card(
                shape: StadiumBorder(),
                color: Colors.white,
                child: Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Card(
                shape: StadiumBorder(),
                color: Colors.white,
                child: Center(child: Text(email, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Card(
                shape: StadiumBorder(),
                color: Colors.white,
                child: Center(child: Text(mobileNumber, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Card(
                shape: StadiumBorder(),
                color: Colors.white,
                child: Center(child: Text(profession, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Card(
                shape: StadiumBorder(),
                color: Colors.white,
                child: Center(child: Text(address, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
