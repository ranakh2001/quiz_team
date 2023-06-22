import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/pages/home.dart';
import 'package:multi_quiz_s_t_tt9/widgets/my_outline_btn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants.dart';
import '../modules/multipe_choice/quizBrainMultiple.dart';

class MultiQScreen extends StatefulWidget {
  const MultiQScreen({Key? key}) : super(key: key);

  @override
  State<MultiQScreen> createState() => _MultiQScreenState();
}

class _MultiQScreenState extends State<MultiQScreen> {
  QuizBrainMulti quizBrainMulti = QuizBrainMulti();

  Color firstAnsweColor = Colors.white;
  Color secondAnsweColor = Colors.white;
  Color thirdAnsweColor = Colors.white;

  bool isChoose = false;
  int score = 0;
  String nextText = 'Next';
  int counter = 10;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        timer.cancel();
        counter = 10;
        quizBrainMulti.nextQuestion();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // int questionLength = quizBrainMulti.getQueionLength();
    // int questionIndex = quizBrainMulti.getQueionIndex();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              kBlueBg,
              kL2,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: const ButtonStyle().copyWith(
                      shape: const MaterialStatePropertyAll(
                        CircleBorder(),
                      ),
                      side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.white)),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      height: 56,
                      width: 56,
                      child: CircularProgressIndicator(
                        value: counter / 10,
                        color: Colors.white,
                        backgroundColor: Colors.white12,
                      ),
                    ),
                    Text(
                      counter.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Sf-Pro-Text'),
                    )
                  ]),
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          side: const BorderSide(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Center(
                  child: Image.asset('assets/images/ballon-b.png'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '',
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Sf-Pro-Text',
                    color: Colors.white60),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                quizBrainMulti.getQuestionText(),
                style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Sf-Pro-Text',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: isChoose
                      ? () {}
                      : () {
                          if (quizBrainMulti.getQuestionAnswer()==
                              quizBrainMulti.getQuestionAnswer()) {
                            score++;
                            firstAnsweColor =
                                const Color.fromARGB(255, 226, 164, 6);
                          } else {
                            firstAnsweColor = Colors.red;
                          }
                          setState(() {
                            isChoose = true;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => firstAnsweColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Center(
                        child: Text(
                          quizBrainMulti.getOptions(),
                          style: const TextStyle(
                              color: kL2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      if (quizBrainMulti.getQuestionAnswer() ==
                          quizBrainMulti.getFirstChoice())
                        const Icon(
                          Icons.check_rounded,
                          color: kL2,
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: isChoose
                      ? () {}
                      : () {
                          if (quizBrainMulti.getCorrectAnswe() ==
                              quizBrainMulti.getSecondChoice()) {
                            score++;
                            firstAnsweColor =
                                const Color.fromARGB(255, 226, 164, 6);
                          } else {
                            firstAnsweColor = Colors.red;
                          }
                          setState(() {
                            isChoose = true;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => secondAnsweColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Center(
                        child: Text(
                          quizBrainMulti.getSecondChoice(),
                          style: const TextStyle(
                              color: kL2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      if (quizBrainMulti.getCorrectAnswe() ==
                          quizBrainMulti.getSecondChoice())
                        const Icon(
                          Icons.check_rounded,
                          color: kL2,
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: isChoose
                      ? () {}
                      : () {
                          if (quizBrainMulti.getCorrectAnswe() ==
                              quizBrainMulti.getThirdChoice()) {
                            score++;
                            firstAnsweColor =
                                const Color.fromARGB(255, 226, 164, 6);
                          } else {
                            firstAnsweColor = Colors.red;
                          }
                          setState(() {
                            isChoose = true;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => thirdAnsweColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Center(
                        child: Text(
                          quizBrainMulti.getThirdChoice(),
                          style: const TextStyle(
                              color: kL2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      if (quizBrainMulti.getCorrectAnswe() ==
                          quizBrainMulti.getThirdChoice())
                        const Icon(
                          Icons.check_rounded,
                          color: kL2,
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstAnsweColor = Colors.white;
                        secondAnsweColor = Colors.white;
                        thirdAnsweColor = Colors.white;

                        isChoose = false;

                        if (quizBrainMulti.isFinish()) {
                          Alert(
                              context: context,
                              title: 'Your Score',
                              desc: '$questionLength / $score',
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    nextText = 'Next';
                                    score = 0;
                                    quizBrainMulti.reset();
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  color: const Color.fromARGB(6, 179, 134, 1),
                                  child: const Text(
                                    'Done!',
                                    style: TextStyle(
                                        color: kL1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]).show();
                        } else {
                          quizBrainMulti.nextQustion();
                          if (quizBrainMulti.isLastQuestion()) {
                            nextText = 'Finish';
                          }
                        }
                      });
                    },
                    child: Text(
                      nextText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
