import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Res/Component/custom_button.dart';
import 'package:todo_app/Res/Component/text_form_field.dart';
import 'package:todo_app/View_Model/login_controller.dart';

import '../../../Utils/flutter_toast.dart';


class AddFavourite extends StatefulWidget {
  const AddFavourite({Key? key}) : super(key: key);

  @override
  State<AddFavourite> createState() => _AddFavouriteState();
}

class _AddFavouriteState extends State<AddFavourite> {
  final linkImageController = TextEditingController();
  final fullNameController = TextEditingController();
  final db = FirebaseFirestore.instance.collection('favourite');
  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Favourite'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textfield(
            title: 'Link a Photo',
            controller: linkImageController,
          ),
          Textfield(
            title: 'Your Full Name',
            controller: fullNameController,
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
              title: "Add",
              loading: controller.loading,
              onTap: ()async{
                controller.setLoading(true);
                try{
                  await db.add({
                    "photoURL" : linkImageController.text,
                    "Name" : fullNameController.text,
                  }).then((value){
                    controller.setLoading(false);
                    Utils().FlutterToast(context, 'Add Data');
                    Navigator.pop(context);
                  }).onError((error, stackTrace){
                    controller.setLoading(false);
                    Utils().FlutterToast(context,error.toString());
                  });
                }catch(e){
                  controller.setLoading(false);
                  Utils().FlutterToast(context,e.toString());
                }
              }
          ),
        ],
      ),
    );
  }
}
