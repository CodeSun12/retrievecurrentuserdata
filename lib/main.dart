import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:retrievecurrentuserdata/login.dart';
import 'package:retrievecurrentuserdata/register.dart';

import 'fetch_current_user_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Current User Data',
      home: LoginScreen(),
    );
  }
}

