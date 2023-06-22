import 'package:flutter/material.dart';

class Level {
  final String title;
  final String subtitle;
  final String? description;
  final String? image;
  final IconData? icon;
  final List<Color> colors;
  final String rootName;

  Level(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.colors,
      required this.rootName,
      this.image,
      this.icon});
}
