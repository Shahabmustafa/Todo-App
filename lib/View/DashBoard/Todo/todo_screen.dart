import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final nameController = TextEditingController();
  final lastController = TextEditingController();
  final db = FirebaseFirestore.instance.collection('todo');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      // body:
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){
          Build(context);
        },
          label: Text('Add Todo'),
      ),
    );
  }
  Build(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Enter Your First Name",
                  border: OutlineInputBorder()
              ),
            ),
            icon: const Text('Fill Your Placeholder',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            content: TextFormField(
              controller: lastController,
              decoration: const InputDecoration(
                hintText: "Enter Your Last Name",
                border: OutlineInputBorder()
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        db.doc().set({
                          'firstName' : nameController.text,
                          'lastName' : lastController.text,
                        });
                      },
                      child: Text('Add'),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}
