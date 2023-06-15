
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