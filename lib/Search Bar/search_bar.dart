import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  TextEditingController nameController = TextEditingController();
  final db = FirebaseFirestore.instance.collection('todo');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      suffixIcon: InkWell(
                        onTap: (){
                          db.add({
                            'Name' : nameController.text,
                          }).then((value){
                            print(value);
                            nameController.clear();
                          }).onError((error, stackTrace){
                            print(error.toString());
                          });
                        },
                        child: Icon(Icons.send),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}



