import 'package:multi_quiz_s_t_tt9/modules/quiz_brain.dart';
import 'package:multi_quiz_s_t_tt9/modules/true_false/true_false_question.dart';

class True_False_Brain extends QuizBrain {
  final List<True_False_Question> _question_Bank = [
    True_False_Question(
      question_Text: 'You can lead a cow down stairs but not up stairs.',
      question_Answer: false,
    ),
    True_False_Question(
      question_Text:
          'Approximately one quarter of human bones are in the feet.',
      question_Answer: true,
    ),
    True_False_Question(
      question_Text: 'A slug\'s blood is green.',
      question_Answer: true,
    ),
  ];
  @override
  setQuestionList() {
    questionBank = _question_Bank;
  }

  @override
  bool getQuestionAnswer_true_or_false() {
    return (questionBank[getQuestionNum()] as True_False_Question)
        .question_Answer;
  }

  @override
  int getQuestionAnswer_multiple() {
    return 0;
  }
}
