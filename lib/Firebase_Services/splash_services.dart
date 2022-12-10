import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter/UI/home.dart';
import 'package:fluter/auth/loginScreen.dart';
import 'package:flutter/material.dart';

class SplashServices{
   void isLogin(BuildContext context)async {
final auth=FirebaseAuth.instance;
final user=auth.currentUser;
if(user!=null)
  {
     Timer(const Duration(seconds: 3),
        ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const home()))
    );
  } else{
 Timer(const Duration(seconds: 3),
        ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const loginScreen()))
    );
}

  }
}