import 'package:firebase_core/firebase_core.dart';
import 'package:fluter/Splash_screen.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.brown,
      ),
      home: const Splash_Screen(),
    );
  }
}



