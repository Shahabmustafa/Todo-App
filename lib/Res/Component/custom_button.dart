

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,required this.title,required this.onTap,this.loading = false,this.colors}) : super(key: key);
  String title;
  VoidCallback onTap;
  bool loading;
  Color? colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: InkWell(
        onTap:  loading ? null : onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          child: loading ?  Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                ),
              ),
          ),
        ),
      ),
    );
  }
}
