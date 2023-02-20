import 'package:flutter/material.dart';
import 'package:monumental/widgets/habit_grid.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
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
            HabitGrid(
              name: 'Dar da porrada ao lea',
              color: colors[0],
            ),
            HabitGrid(
              name: 'Chorar',
              color: colors[1],
            ),
            HabitGrid(
              name: 'Estudar Flutter',
              color: colors[2],
            ),
            HabitGrid(
              name: 'Chorar de novo',
              color: colors[3],
            ),
          ]),
        ),
      ]),
    );
  }
}
