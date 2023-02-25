import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental/models/habit.dart';
import 'package:monumental/models/reminder.dart';
import 'package:monumental/screens/main_screen.dart';
import 'package:monumental/services/notitications.dart';
import 'package:monumental/utils/constans.dart';
import 'package:monumental/widgets/header.dart';
import 'package:monumental/widgets/history.dart';
import 'package:monumental/widgets/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [];
  @override
  void initState() {
    super.initState();

    void getReminders() async {
      final prefs = await SharedPreferences.getInstance();
      final storedReminders = prefs.getString('@monumental_reminders') ?? '[]';
      print('********************');
      print(storedReminders);

      List parseReminders = json.decode(storedReminders);
      List<Habit> habitList = parseReminders
          .map(
            (e) => Habit(
              activeNotifications: e['activeNotifications'],
              title: e['title'],
              frencuency: e['frecuency'].cast<int>(),
              reminders: e['reminders'].cast<Reminder>(),
            ),
          )
          .toList();
      setState(() {
        habits = habitList;
      });
    }

    getReminders();
    Notifications().initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      buttonAction: () => Navigator.pushNamed(context, '/create'),
      buttonType: ButtonType.create,
      child: Column(
        children: [
          Header(
            title: 'Inicio',
            icon: FontAwesomeIcons.bars,
            onTap: (() => print('')),
          ),
          const Quote(
            quote: 'We first make our habits, \nand then our habits\nmake us.',
            author: 'anonynomous',
          ),
          History(
            habits: habits,
          ),
        ],
      ),
    );
  }
}
