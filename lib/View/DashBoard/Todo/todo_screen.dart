import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/Res/Component/custom_button.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final nameController = TextEditingController();
  final lastController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        // stream: todo.snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text('data');
          }else{
            return Center(child: Text('Loading....'),);
          }
        },
      ),
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
