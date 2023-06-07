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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: db.snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                      var data = snapshot.data!.docs[index];
                      return Card(
                        child: ListTile(
                          title: Text(data['Name']),
                          trailing: InkWell(
                            onTap: (){
                              deleteDocuments();
                            },
                            child: Icon(Icons.delete),
                          ),
                        ),
                      );
                      },
                  ),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
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
  void deleteDocuments() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('todo')
          .where('Name', isNotEqualTo: 'ereierefrerfhreiuhiuh')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }

      print('Documents deleted successfully.');
    } catch (e) {
      print('Error deleting documents: $e');
    }
  }
}



