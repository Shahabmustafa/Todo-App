import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'add_note.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  final List<Map<String, dynamic>> _items = List.generate(
      200,
          (index) => {
        "id": index,
        "title": "Item $index",
        "height": Random().nextInt(150) + 50.5
      });

  final Note = FirebaseFirestore.instance.collection('Notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Note.snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return MasonryGridView.count(
              itemCount: snapshot.data!.docs.length,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              // the number of columns
              crossAxisCount: 3,
              // vertical gap between two items
              mainAxisSpacing: 4,
              // horizontal gap between two items
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                // display each item with a card
                return Card(
                  // Give each item a random background color
                  color: Color.fromARGB(
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256)),
                  child: SizedBox(
                    height: _items[index]['height'],
                    child: Center(
                      child: Text(
                        snapshot.data!.docs[index]['Note Text'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        label: Row(
          children: [
            Icon(Icons.add),
            Text('Add Notes'),
          ],
        ),
      ),
    );
  }
}
