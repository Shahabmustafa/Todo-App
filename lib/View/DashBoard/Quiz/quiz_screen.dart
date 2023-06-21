import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/Res/Component/custom_button.dart';
import 'package:todo_app/View/DashBoard/Quiz/question_list.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    questionList[currentQuestionIndex].questionText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: questionList[currentQuestionIndex]
                .answerList.map(
                  (e) => button(e)
            ).toList(),
          ),
          nextButton(),
        ],
      ),
    );
  }
  Widget button(Answer answer){
    bool isSelected = answer == selectAnswer;
    return CustomButton(
        colors: isSelected ? Colors.red : Colors.green,
        title: answer.answerText,
        onTap: (){
          if(selectAnswer == null){
            if(answer.isCorrect){
              score++;
            }
          }
          setState(() {
            selectAnswer = answer;
          });
        }
    );
  }
  Widget nextButton(){
    bool isLastQuestion = false;
    if(currentQuestionIndex == questionList.length -1){
      isLastQuestion = true;
    }
    return InkWell(
      onTap: (){
        if(isLastQuestion){
          showDialog(
              context: context,
              builder: (_) => DilogAlert(),
          );
        }else{
          setState(() {
            selectAnswer = null;
            currentQuestionIndex++;
          });
        }
      },
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(child: Text(
          isLastQuestion ? 'Submit' : "Next",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
    );

  }
  DilogAlert(){
    bool isPressed = false;
    if(score >= questionList.length + 0.6){
      isPressed = true;
    }
    String title  = isPressed ? "Passed" : "Faild";
    return AlertDialog(
      title: Text(title + "Your Score is $score"),
      content: ElevatedButton(
        child: Text('Restart'),
        onPressed: (){
          setState(() {
            Navigator.pop(context);
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              selectAnswer = null;
            });
          });
        },
      ),
    );
  }
}
