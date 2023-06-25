import 'package:multi_quiz_s_t_tt9/modules/question.dart';

class Multiple_Question extends Question {
  final int question_Answer;

  final List<String> options;

  Multiple_Question(
      {required super.question_Text,
      required this.question_Answer,
      required this.options});
}
