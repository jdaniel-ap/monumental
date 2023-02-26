import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental/models/habit.dart';
import 'package:monumental/models/reminder.dart';
import 'package:monumental/screens/main_screen.dart';
import 'package:monumental/utils/constans.dart';
import 'package:monumental/utils/get_reminders.dart';
import 'package:monumental/widgets/header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HabitDashboard extends StatefulWidget {
  const HabitDashboard({super.key});

  @override
  State<HabitDashboard> createState() => _HabitDashboardState();
}

class _HabitDashboardState extends State<HabitDashboard> {
  int minTitleLength = 15;
  Habit? habit = Habit(
      activeNotifications: false, title: '0000', frencuency: [], reminders: []);
  HabitsData habitController = HabitsData();

  getHabit() async {
    Habit data = await habitController.getHabit(context);
    setState(() {
      habit = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getHabit();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      withoutBackground: true,
      buttonAction: () => Navigator.pushNamed(context, '/create'),
      buttonType: ButtonType.create,
      child: Column(
        children: [
          Header(
            title: habit!.title.length > minTitleLength
                ? '${habit!.title[0].toUpperCase() + habit!.title.split(' ').sublist(0, 3).join(' ').substring(1).toLowerCase()}...'
                : habit!.title[0].toUpperCase() +
                    habit!.title.substring(1).toLowerCase(),
            primaryIcon: FontAwesomeIcons.arrowLeft,
            secondaryIcon: Image.asset(
              'images/edit.png',
              width: 20,
            ),
            primaryAction: () => Navigator.pop(context),
            secondaryAction: () {},
          ),
        ],
      ),
    );
  }
}
