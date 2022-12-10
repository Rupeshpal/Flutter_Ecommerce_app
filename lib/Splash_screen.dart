import 'package:fluter/Firebase_Services/splash_services.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
   SplashServices splashScren= SplashServices();
   
  @override
   void initState() {
    
    super.initState();
    splashScren.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Center(
        child: Text("Loadind...."),
      ),
    );
  }
}
