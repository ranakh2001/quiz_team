import 'package:multi_quiz_s_t_tt9/modules/question.dart';

abstract class QuizBrain {
  int _question_number = 0;
  List<Question> questionBank = [];

  String getQuestionText() {
    return questionBank[_question_number].question_Text;
  }

  @override
  setQuestionList();
  bool getQuestionAnswer_true_or_false();

  int getQuestionAnswer_multiple();

  void nextQuestion() {
    if (_question_number < questionBank.length - 1) {
      _question_number++;
    }
  }

  bool isFinished() {
    if (_question_number >= questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int getQuestionNum() {
    return _question_number;
  }

  int getquestionsLength() {
    return questionBank.length;
  }

  bool isLastQuestion() {
    if (_question_number >= questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _question_number = 0;
  }
}
