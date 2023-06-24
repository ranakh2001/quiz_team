// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class QuestionMultiple {
//   String questionText;
//   String questionAnswer;
//   List<String> options;
//   // String firstChoice;
//   // String secondChoice;
//   // String thirdChoice;

//   QuestionMultiple(
//      this.questionText,
//       this.questionAnswer,
//      this.options,
//     // required  this.firstChoice,
//     // required  this.secondChoice,
//     // required  this.thirdChoice,
// );
// }

class QuestionMultiple {
  String questionText;
  int questionAnswer;
  List<String> options;

  QuestionMultiple(
    this.questionText,
    this.questionAnswer,
    this.options,
  );
}
