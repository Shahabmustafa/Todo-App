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
  final searchController = TextEditingController();
  final db = FirebaseFirestore.instance.collection('todo');
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: db.snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                return ListTile(
                  title: Text(
                    '${snapshot.data!.docs[index]['subject']}',
                  ),
                  subtitle: Text(' ${snapshot.data!.docs[index]['task']}'),
                  trailing: InkWell(
                    onTap: (){
                      db.doc('${index}').delete();
                    },
                    child: Icon(Icons.delete,color: Colors.red,),
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
                  hintText: "Enter Your Subject",
                  border: OutlineInputBorder()
              ),
            ),
            icon: const Text('Fill Your Placeholder',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            content: TextFormField(
              controller: lastController,
              decoration: const InputDecoration(
                hintText: "Enter Your Task",
                border: OutlineInputBorder()
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        db.doc("${index++}").set({
                          'subject' : nameController.text,
                          'task' : lastController.text,
                        }).then((value){
                          nameController.clear();
                          lastController.clear();
                          Navigator.pop(context);
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
