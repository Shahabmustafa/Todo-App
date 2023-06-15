import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Res/Component/custom_button.dart';
import 'package:todo_app/View_Model/login_controller.dart';

import '../../../Utils/flutter_toast.dart';


class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final noteController = TextEditingController();
  final Note = FirebaseFirestore.instance.collection('Notes');
  @override
  Widget build(BuildContext context) {
    final Loading = Provider.of<LoginController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: noteController,
              decoration: const InputDecoration(
                hintText: "Enter Your Note Text",
                border: OutlineInputBorder(),
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              maxLines: 10,
              maxLength: 1000,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              loading: Loading.loading,
              title: "Add",
              onTap: ()async{
                Loading.setLoading(true);
                try{
                  await Note.add({
                    'Note Text' : noteController.text,
                  }).then((value){
                    Loading.setLoading(false);
                    Utils().FlutterToast(context, value.toString());
                    Navigator.pop(context);
                    noteController.clear();
                  }).onError((error, stackTrace){
                    Loading.setLoading(false);
                    Utils().FlutterToast(context, error.toString());
                  });
                }catch(e){
                  Loading.setLoading(false);
                  Utils().FlutterToast(context, e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
