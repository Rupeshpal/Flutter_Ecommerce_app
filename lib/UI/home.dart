import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fluter/UI/add_post.dart';
import 'package:fluter/auth/loginScreen.dart';
import 'package:fluter/utills/utills.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final auth= FirebaseAuth.instance;
  final ref= FirebaseDatabase.instance.ref('post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            hoverColor: Colors.green,
            highlightColor: Colors.green,
            onPressed: () {
              auth.signOut().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const loginScreen()));
              }).onError((error, stackTrace){
                utillls().toastMessage(error.toString());
              });
            },
          ),
        ],
        elevation: 10,
        backgroundColor: Colors.blueGrey,
        title: const Text("All Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const add_post()));
        },
        child:const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              defaultChild: const Text("Loading..."),
              query: ref,
               
               itemBuilder: (context,snapshot,animation,index)
               {
                return   ListTile(
                 title: Text(snapshot.child('title').child('id').value.toString()),
                );
                
               }
               ),
               
          ),
          
          
        ],
      ),

    );

  }
}
