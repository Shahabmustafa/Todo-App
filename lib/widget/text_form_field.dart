
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield({Key? key,required this.title,required this.controller}) : super(key: key);
  String title;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,required this.title,required this.onTap}) : super(key: key);
  String title;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          height: 70,
          child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
