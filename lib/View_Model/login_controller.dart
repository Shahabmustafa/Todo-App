import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Utils/flutter_toast.dart';
import 'package:todo_app/View/DashBoard/dashboard_screen.dart';

class LoginController extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  final Firebase_Cloude = FirebaseFirestore.instance.collection('user');
  final auth = FirebaseAuth.instance;

  logIn(BuildContext context,String email,String password)async{
    setLoading(true);
    try{
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value){
        setLoading(false);
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
        Utils().FlutterToast(context, "You Have Sucessfully Login");
      }).onError((error, stackTrace){
        setLoading(false);
        Utils().FlutterToast(context, error.toString());
      });
    }catch(e){
      setLoading(false);
      Utils().FlutterToast(context, e.toString());
    }
  }
}