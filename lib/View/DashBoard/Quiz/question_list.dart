

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
        "1.Flutter is a mobile app development platform created by______?",
        [
          Answer('Nokia', false),
          Answer('Samsung', false),
          Answer('Google', true),
          Answer('Apple', false),
        ]
    ),
    Question(
        "2.which company is the owner of github?",
        [
          Answer('Twitter', false),
          Answer('Microsoft', true),
          Answer('Facebook', false),
          Answer('Apple', false),
        ]
    ),
    Question(
        "3.Dart is an ________?",
        [
          Answer('open-source', false),
          Answer('general-purpose', false),
          Answer('object-oriented programming language', false),
          Answer('All of these', true),
        ]
    ),
    Question(
        "4.Dart is a programming language designed by ________?",
        [
          Answer('Lars Bak, Kasper Lund', true),
          Answer('Jeff Bezos', false),
          Answer('Mark Zuckerberg', false),
          Answer('Jawed Karim', false),
        ]
    ),
    Question(
        "5.What are the types of developers?",
        [
          Answer('Web developer', false),
          Answer('Game developer', false),
          Answer('Back-end developer', false),
          Answer('All of These', true),
        ]
    ),
    Question(
        "6.Who is the founder of apple company?",
        [
          Answer('Steve Jobs', false),
          Answer('Steve Wozniak', false),
          Answer('Ronald Wayne', false),
          Answer('All of These', true),
        ]
    ),
  ];
  return list;
}