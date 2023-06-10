import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  TextEditingController nameController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance.collection('user').doc(auth.currentUser!.uid).collection('todo');
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: db.snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          var data = snapshot.data!.docs[index];
                          return Card(
                            child: ListTile(
                              title: Text("${data['Message']}"),
                              trailing: InkWell(
                                onTap: (){
                                  db.doc().delete();
                                },
                                child: Icon(Icons.delete),
                              ),
                            ),
                          );
                        }
                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Your Message",
                      suffixIcon: InkWell(
                        onTap: (){
                          db.add({
                            "Message" : nameController.text,
                          }).then((value){
                           print("Your Data Has Save");
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



