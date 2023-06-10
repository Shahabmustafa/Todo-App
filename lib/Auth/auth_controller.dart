
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Auth/login_screen.dart';
import 'package:todo_app/Search%20Bar/search_bar.dart';

abstract class AuthFunctionController{
  Future<void> LogIn(BuildContext context,String email,String password);
  Future<void> SignUp(BuildContext context,String userName,String email,String password);
  Future<void> SignOut(BuildContext context);
}

class AuthController extends AuthFunctionController{
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection('user');

  @override
  Future<void> SignUp(BuildContext context,String userName,String email,String password) {
    try{
      auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value){
        db.doc(auth.currentUser!.uid).set({
          'UserName' : userName,
          'email' : email,
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBar()));
      }).onError((error, stackTrace){
        print(error.toString());
      });
    }catch(e){
      print(e.toString());
    }
    // TODO: implement LogIn
    throw UnimplementedError();
  }

  @override
  Future<void> SignOut(BuildContext context)async{
    try{
      await auth.signOut().then((value){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }).onError((error, stackTrace){
        print(error.toString());
      });
    }catch(e){
      print(e.toString());
    }
    // TODO: implement SignOut
    throw UnimplementedError();
  }

  @override
  Future<void> LogIn(BuildContext context,String email,String password) async{
    try{
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBar()));
      }).onError((error, stackTrace){
        print(error.toString());
      });
    }catch(e){
      print(e.toString());
    }
    // TODO: implement SignUp
    throw UnimplementedError();
  }

}