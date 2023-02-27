
import 'package:blogapp1/home/home.dart';
import 'package:blogapp1/home/home1.dart';
import 'package:blogapp1/home/profile.dart';
import 'package:blogapp1/users/profileshow.dart';
import 'package:blogapp1/users/users.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home/search.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

    class MyApp extends StatefulWidget {
      const MyApp({Key? key}) : super(key: key);

      @override
      State<MyApp> createState() => _MyAppState();
    }
    String CurrentUserID='';
    String CurrentUserName='';

    String CurrentUserAbout='';
    String CurrentUserEmail='';

    class _MyAppState extends State<MyApp> {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home:home1(),
       debugShowCheckedModeBanner: false,
        );
      }
    }


