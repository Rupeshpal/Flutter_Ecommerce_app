

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter/UI/home.dart';
import 'package:fluter/auth/signup.dart';
import 'package:fluter/utills/utills.dart';
import 'package:fluter/widgets/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
void login(){
    setState(() {
      loading = true;
    });
    auth
    .signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text.toString()).then((value) {
      utillls().toastMessage(value.user!.email.toString());
       setState(() {
        loading = false;
      });
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const home()));
    } ).onError((error, stackTrace) {
      debugPrint(error.toString());
      utillls().toastMessage(error.toString());
      setState(() {
        loading = false;
      });

      });
}
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async{
        SystemNavigator.pop();
        return true;
        
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shadowColor: Colors.black87,
          elevation: 8,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Login Your App Now",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some Email';
                            }
                            return null;
                          },
                          
                          controller: _emailController,
                          
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                          ),
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return"Please enter the password" ;
                              
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundButton(
                          tittle: 'Login',
                          loading: loading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                        ),
                        const SizedBox(height:7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            
                            const Text("Don't have account?", style: TextStyle(
                              color: Colors.green,
                            ),),
                            TextButton(onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => const Signup())));
                            }, child: const Text("Signup"))
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
