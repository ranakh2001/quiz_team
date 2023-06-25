import 'package:flutter/material.dart';

import '../constants.dart';
import 'level.dart';

class Levels_Data {
  List<Level> levels = [
    Level(
        title: 'True or False',
        subtitle: 'Level 1',
        description: 'Rise up to your IQ',
        image: 'assets/images/bags.png',
        icon: Icons.check,
        colors: [kL1, kL12],
        rootName: 'level1',
        status: true),
    Level(
        title: 'Multiple choice',
        subtitle: 'Level 2',
        description: 'Rise up to your IQ',
        image: 'assets/images/ballon-s.png',
        icon: Icons.play_arrow,
        colors: [kL2, kL22],
        rootName: 'level2',
        status: false),
  ];
}
