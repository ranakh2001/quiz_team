import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/constants.dart';
import 'package:multi_quiz_s_t_tt9/modules/levels_data.dart';
import 'package:multi_quiz_s_t_tt9/pages/level_describtion.dart';

import '../modules/level.dart';
import '../widgets/my_level_widget.dart';
import '../widgets/my_outline_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Levels_Data levels_data = Levels_Data();
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
            function: () {},
          ),
          MYOutlineBtn(
              icon: Icons.person,
              iconColor: kBlueIcon,
              bColor: kGreyFont.withOpacity(0.5),
              function: () {}),
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
                itemCount: levels_data.levels.length,
                itemBuilder: (context, index) {
                  return MyLevelWidget(
                    function: () {
                      // levels_data.levels[0].status
                      // ?
                      (Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LevelDescription(
                              level: levels_data.levels[index],
                            );
                          },
                        ),
                      ));
                      // : null;
                    },
                    level: levels_data.levels[index],
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
