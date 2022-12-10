import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fluter/utills/utills.dart';
import 'package:fluter/widgets/RoundButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class add_post extends StatefulWidget {
  const add_post({Key? key}) : super(key: key);

  @override
  State<add_post> createState() => _add_postState();
}

// ignore: camel_case_types
class _add_postState extends State<add_post> {
  // ignore: non_constant_identifier_names
  final postController = TextEditingController();
  bool loading = false;
  final DatabaseRef = FirebaseDatabase.instance.ref('post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Add Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 38,
            ),
            TextFormField(
                controller: postController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    icon: Icon(
                      Icons.add,
                      color: Colors.blueGrey,
                      
                    ),
                    
                    hintText: 'Add post')),
            const SizedBox(
              height: 38,
            ),
            RoundButton(
                tittle: 'Add',
              loading: loading,
                onTap: () {
                  setState(() {
                    loading=true;
                  });
                  DatabaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set(
                      {
                        'title': postController.text.toString(),

                        'id': DateTime.now().microsecondsSinceEpoch.toString()
                      }).then((value) {
                    utillls().toastMessage("Added successfully");
                    setState(() {
                      loading=false;
                    });
                  }).onError((error, stackTrace) {
                    utillls().toastMessage(error.toString());
                    setState(() {
                      loading=false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
