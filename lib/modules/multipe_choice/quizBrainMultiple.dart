import 'package:multi_quiz_s_t_tt9/modules/multipe_choice/questionMultiple.dart';

class QuizBrainMulti {
  int _questionNumber = 0;

  final List<QuestionMultiple> _questionBank = [
    QuestionMultiple(
        'What is the capital of Japan?', 0, ['Tokyo', 'Osaka', 'Kyoto']),
    QuestionMultiple('Which city serves as the capital of Germany?', 2,
        ['Munich', 'Frankfurt', 'Berlin']),
    QuestionMultiple('What is the capital of South Africa?', 1,
        ['Johannesburg', 'Pretoria', 'Berlin']),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  List<String> getOptions() {
    return _questionBank[_questionNumber].options;
  }

  int getQueionLength() {
    return _questionBank.length;
  }

  int getQueionIndex() {
    return _questionNumber + 1;
  }

  int getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isLastQuestion() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
