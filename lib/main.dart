import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/View/DashBoard/Favourite/favourite_controller.dart';
import 'package:todo_app/View/DashBoard/dashboard_screen.dart';
import 'package:todo_app/View_Model/login_controller.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => LoginController(),
          ),
          ChangeNotifierProvider(
              create: (_) => FavouriteController(),
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.black
          ),
          primarySwatch: Colors.blue,
        ),
        home: DashBoardPage(),
      ),
    );
  }
}