import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/modules/true_false/true_false_brain.dart';

import '../constants.dart';
import '../widgets/my_outline_btn.dart';
import 'home.dart';

class TrueFalseQuiz extends StatefulWidget {
  const TrueFalseQuiz({super.key});

  @override
  State<TrueFalseQuiz> createState() => _TrueFalseQuizState();
}

class _TrueFalseQuizState extends State<TrueFalseQuiz> {
  True_False_Brain quizBrain = True_False_Brain();
  bool isAnswered = false;
  Color answerColor = Colors.white;
  Color othersColor = Colors.white;
  late bool useranswer;
  late int questionnum;
  late int questionslength;
  bool finished = false;
  int score = 0;
  int counter = 10;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    useranswer = false;
    quizBrain.setQuestionList();
    questionnum = quizBrain.getQuestionNum();
    questionslength = quizBrain.getquestionsLength();
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        counter = 10;
        quizBrain.nextQuestion();
        answerColor = Colors.white;
        othersColor = Colors.white;
        isAnswered = false;
        questionnum = quizBrain.getQuestionNum();
        questionslength = quizBrain.getquestionsLength();
        finished = quizBrain.isFinished();
      }
      if (finished) {
        endQuiz();
      }
    });
  }

  endQuiz() {
    print("finished");
    Timer(const Duration(microseconds: 250), () {
      setState(() {
        timer.cancel();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Finished You Are done"),
                  content: Text(
                    "Your score is : $score",
                    style: const TextStyle(
                        fontSize: 16,
                        color: kL1,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sf-Pro-Text"),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            score = 0;
                            quizBrain.reset();
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (context) => false);
                        },
                        child: const Text(
                          "Finish",
                          style:
                              TextStyle(color: kL1, fontFamily: "Sf-Pro-Text"),
                        ))
                  ],
                ));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void answer(bool userAnswer) {
    timer.cancel();
    setState(() {
      isAnswered = true;
      useranswer = userAnswer;
      if (userAnswer == quizBrain.getQuestionAnswer_true_or_false()) {
        answerColor = Colors.green;
        score++;
      } else {
        answerColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(gradient: LinearGradient(colors: [kL1, kL12])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MYOutlineBtn(
                      shapeBorder: CircleBorder(),
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      icon: Icons.close,
                      function: () {
                        timer.cancel();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (context) => false);
                      },
                    ),
                    Stack(alignment: Alignment.center, children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: CircularProgressIndicator(
                          value: counter / 10,
                          color: Colors.white,
                          backgroundColor: Colors.white24,
                        ),
                      ),
                      Text(
                        counter.toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: "Sf-Pro-Text",
                            color: Colors.white),
                      )
                    ]),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "3",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Center(child: Image.asset("assets/images/ballon-b.png")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "question ${questionnum + 1} of $questionslength",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Sf-Pro-Text",
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Sf-Pro-Text",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          backgroundColor: isAnswered
                              ? useranswer
                                  ? answerColor
                                  : othersColor
                              : othersColor,
                          disabledBackgroundColor: useranswer
                              ? answerColor.withOpacity(0.5)
                              : othersColor),
                      onPressed: isAnswered
                          ? null
                          : () {
                              answer(true);
                            },
                      child: Text(
                        "True",
                        style: TextStyle(
                          color: isAnswered
                              ? useranswer
                                  ? Colors.white
                                  : kL1
                              : kL1,
                          fontFamily: "Sf-Pro-Text",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          backgroundColor: isAnswered
                              ? useranswer
                                  ? othersColor
                                  : answerColor
                              : othersColor,
                          disabledBackgroundColor: useranswer
                              ? othersColor.withOpacity(0.5)
                              : answerColor.withOpacity(0.5)),
                      onPressed: isAnswered
                          ? null
                          : () {
                              answer(false);
                            },
                      child: Text(
                        "False",
                        style: TextStyle(
                          color: isAnswered
                              ? useranswer
                                  ? kL1
                                  : Colors.white
                              : kL1,
                          fontFamily: "Sf-Pro-Text",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: quizBrain.isFinished()
                            ? endQuiz
                            : () {
                                setState(() {
                                  finished = quizBrain.isFinished();
                                  quizBrain.nextQuestion();
                                  answerColor = Colors.white;
                                  othersColor = Colors.white;
                                  isAnswered = false;
                                  questionnum = quizBrain.getQuestionNum();
                                  questionslength =
                                      quizBrain.getquestionsLength();
                                  counter = 10;
                                });
                              },
                        child: Text(
                          quizBrain.isFinished() ? "Finish" : "Next",
                          style: const TextStyle(
                              fontFamily: "Sf-Pro-Text",
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
