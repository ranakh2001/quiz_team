import 'package:multi_quiz_s_t_tt9/modules/true_false/question.dart';

class QuizBrain {
  int _i = 0;

  final List<Question> _questionBank = [
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
  ];

  String getQuestionText() {
    return _questionBank[_i].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_i].questionAnswer;
  }

  void nextQuestion() {
    if (_i < _questionBank.length - 1) {
      _i++;
    }
  }

  bool isFinished() {
    if (_i >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
  int getQuestionNum() {
    return _i;
  }

  int getquestionsLength() {
    return _questionBank.length;
  }
  void reset() {
    _i = 0;
  }
}
