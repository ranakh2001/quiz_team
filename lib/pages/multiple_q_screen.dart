import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/modules/level.dart';
import 'package:multi_quiz_s_t_tt9/modules/multipe_choice/multiple_question_brain.dart';
import 'package:multi_quiz_s_t_tt9/pages/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants.dart';

class MultiQScreen extends StatefulWidget {
  const MultiQScreen({Key? key}) : super(key: key);

  @override
  State<MultiQScreen> createState() => _MultiQScreenState();
}

class _MultiQScreenState extends State<MultiQScreen> {
  Multiple_Question_Brain quizBrainMulti = Multiple_Question_Brain();
  List<Icon> scoreKeeper = [];
  int trues = 0;
  bool? isCorrect;
  int? userChoice;
  bool isFinal = false;
  late Timer timer;

  int counter = 10;
  @override
  void initState() {
    startTimer();
    super.initState();
    quizBrainMulti.setQuestionList();
  }

  void check() {
    int correctAnswer = quizBrainMulti.getQuestionAnswer_multiple();
    cancelTimer();
    setState(() {
      if (correctAnswer == userChoice) {
        isCorrect = true;
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        ++trues;
      } else {
        isCorrect = false;
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });
  }

  void next() {
    setState(() {
      if (quizBrainMulti.isFinished()) {
        cancelTimer();
        Alert(
          context: context,
          title: 'Finish',
          desc: 'Done',
          buttons: [
            DialogButton(
              child: const Text('Finish'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
          ],
        ).show();
      } else {
        counter = 10;
        startTimer();
      }
      isCorrect = null;
      userChoice = null;
      quizBrainMulti.nextQuestion();
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        next();
      }
    });
  }

  void cancelTimer() {
    timer.cancel();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              const Text(
                '',
                style: TextStyle(
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
              Expanded(
                child: ListView.builder(
                  itemCount: quizBrainMulti.getOptions().length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        onPressed: userChoice == null
                            ? () {
                                userChoice = index;
                                check();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: isCorrect == null
                              ? Colors.white60
                              : isCorrect! && userChoice == index
                                  ? Colors.lightGreen
                                  : userChoice == index
                                      ? Colors.red
                                      : Colors.white60,
                          backgroundColor: isCorrect == null
                              ? Colors.white
                              : isCorrect! && userChoice == index
                                  ? Colors.lightGreen
                                  : userChoice == index
                                      ? Colors.red
                                      : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  quizBrainMulti.getOptions()[index],
                                  style: const TextStyle(
                                      color: kL2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            isCorrect == null
                                ? const SizedBox()
                                : isCorrect! && userChoice == index
                                    ? const Icon(
                                        Icons.check_rounded,
                                        color: kL2,
                                      )
                                    : userChoice == index
                                        ? const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )
                                        : const SizedBox()
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(children: scoreKeeper),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => next(),
                    child: Text(
                      quizBrainMulti.isLastQuestion() ? 'Finish' : 'Next',
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
