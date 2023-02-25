import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monumental/models/habit.dart';
import 'package:monumental/widgets/habit_grid.dart';

class History extends StatelessWidget {
  List<Habit> habits;
  History({Key? key, required this.habits}) : super(key: key);
  List<Color> colors = [
    const Color(0xFFFC9D45),
    const Color(0xFFF65B4E),
    const Color(0xFF29319F),
    const Color(0xFF973456),
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(shrinkWrap: false, children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(children: [
            HabitGrid(
              name: 'habits'.toUpperCase(),
              color: Colors.white,
              isHeader: true,
            ),
            ...habits
                .asMap()
                .entries
                .map(
                  (item) => HabitGrid(
                    name: item.value.title[0].toUpperCase() +
                        item.value.title.substring(1, item.value.title.length),
                    color: colors[item.key],
                  ),
                )
                .toList(),
          ]),
        ),
      ]),
    );
  }
}
