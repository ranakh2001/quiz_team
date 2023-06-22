import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/constants.dart';
import 'package:multi_quiz_s_t_tt9/pages/level_describtion.dart';
import 'package:multi_quiz_s_t_tt9/pages/multiple_q_screen.dart';
import 'package:multi_quiz_s_t_tt9/pages/true_false_q_screen.dart';
import 'package:multi_quiz_s_t_tt9/widgets/my_outline_btn.dart';

import '../modules/level.dart';
import '../widgets/my_level_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Level> levels = [
    Level(
        title: 'True or False',
        subtitle: 'Level 1',
        description: 'Rise up to your IQ',
        image: 'assets/images/bags.png',
        icon: Icons.check,
        colors: [kL1, kL12],
        rootName: 'level1'),
    Level(
        title: 'Multiple choice',
        subtitle: 'Level 2',
        description: 'Rise up to your IQ',
        image: 'assets/images/ballon-s.png',
        icon: Icons.play_arrow,
        colors: [kL2, kL22],
        rootName: 'level2'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MYOutlineBtn(
            icon: Icons.favorite,
            iconColor: kBlueIcon,
            bColor: kGreyFont.withOpacity(0.5),
            function: () {
              print("11111");
            },
          ),
          MYOutlineBtn(
              icon: Icons.person,
              iconColor: kBlueIcon,
              bColor: kGreyFont.withOpacity(0.5),
              function: () {
                print("2222");
              }),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let\'s Play',
              style: TextStyle(
                fontSize: 32,
                color: kRedFont,
                fontWeight: FontWeight.bold,
                fontFamily: kFontFamily,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Be the First!',
              style: TextStyle(
                fontSize: 18,
                color: kGreyFont,
                fontFamily: kFontFamily,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return MyLevelWidget(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LevelDescription(
                              level: levels[index],
                            );
                          },
                        ),
                      );
                    },
                    level: levels[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
