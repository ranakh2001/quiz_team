import 'package:multi_quiz_s_t_tt9/modules/multipe_choice/multiple_question.dart';
import 'package:multi_quiz_s_t_tt9/modules/quiz_Brain.dart';

class Multiple_Question_Brain extends QuizBrain {
  final List<Multiple_Question> _question_Bank = [
    Multiple_Question(
      question_Text: 'What is the capital of Japan?',
      options: ['Tokyo', 'Osaka', 'Kyoto'],
      question_Answer: 0,
    ),
    Multiple_Question(
        question_Text: 'Which city serves as the capital of Germany?',
        question_Answer: 2,
        options: ['Munich', 'Frankfurt', 'Berlin']),
    Multiple_Question(
        question_Text: 'What is the capital of South Africa?',
        question_Answer: 1,
        options: ['Johannesburg', 'Pretoria', 'Berlin']),
  ];

  @override
  setQuestionList() {
    questionBank = _question_Bank;
  }

  @override
  int getQuestionAnswer_multiple() {
    return (super.questionBank[super.getQuestionNum()] as Multiple_Question)
        .question_Answer;
  }

  List<String> getOptions() {
    return (super.questionBank[super.getQuestionNum()] as Multiple_Question)
        .options;
  }

  int getQueionIndex() {
    return getQuestionNum() + 1;
  }

  @override
  bool getQuestionAnswer_true_or_false() {
    return false;
  }
}
