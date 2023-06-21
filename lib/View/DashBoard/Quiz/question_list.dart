

class Question{
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText,this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText,this.isCorrect);
}

List<Question> getQuestion(){
  List<Question> list = [
    Question(
        "Flutter is a mobile app development platform created by______?",
        [
          Answer('Nokia', false),
          Answer('Samsung', false),
          Answer('Google', true),
          Answer('Apple', false),
        ]
    ),
    Question(
        "which company is the owner of github?",
        [
          Answer('Twitter', false),
          Answer('Facebook', false),
          Answer('Microsoft', true),
          Answer('Apple', false),
        ]
    ),
    Question(
        "Dart is an ________?",
        [
          Answer('open-source', false),
          Answer('general-purpose', false),
          Answer('object-oriented programming language', false),
          Answer('All of these', true),
        ]
    ),
    Question(
        "Dart is a programming language designed by ________?",
        [
          Answer('Jeff Bezos', false),
          Answer('Mark Zuckerberg', false),
          Answer('Jawed Karim', false),
          Answer('Lars Bak, Kasper Lund', true),
        ]
    ),
  ];
  return list;
}