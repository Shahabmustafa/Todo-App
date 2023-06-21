import 'package:flutter/material.dart';
import 'package:todo_app/View/DashBoard/BMI/bmi_screen.dart';
import 'package:todo_app/View/DashBoard/Favourite/favourite_screen.dart';
import 'package:todo_app/View/DashBoard/Notes/note_screen.dart';
import 'package:todo_app/View/DashBoard/Quiz/quiz_screen.dart';
import 'package:todo_app/View/DashBoard/Weather/weather_screen.dart';
import 'Todo/todo_screen.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<String> title = [
    "Todo",
    "Quiz",
    "BMI Calculator",
    "Weather",
    "Notes",
    "Favourite",
  ];
  List<String> ImageUrl = [
    "images/checklist.png",
    "images/quiz.png",
    "images/bmi.png",
    "images/cloudy.png",
    "images/post-it.png",
    "images/mark.png",
  ];

  List<dynamic> Navigations = [
    const TodoPage(),
    const QuizPage(),
    const BMIPage(),
    const WeatherPage(),
    const NotePage(),
    const FavouritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) =>  Navigations[index]));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageUrl[index],height: 50,width: 50,),
                      SizedBox(
                        height: 20,
                      ),
                      Text("${title[index]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
