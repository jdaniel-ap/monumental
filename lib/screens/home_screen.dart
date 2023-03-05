import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental/models/habit.dart';

import 'package:monumental/screens/main_screen.dart';
import 'package:monumental/services/notitications.dart';
import 'package:monumental/utils/constans.dart';
import 'package:monumental/utils/get_reminders.dart';
import 'package:monumental/widgets/header.dart';
import 'package:monumental/widgets/history.dart';
import 'package:monumental/widgets/quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [];

  void getReminders() async {
    print('***************************');
    HabitsData habitsData = HabitsData();
    List<Habit> habitList = await habitsData.getHabitList();
    setState(() {
      habits = habitList;
    });
  }

  @override
  void initState() {
    super.initState();

    getReminders();
    Notifications().initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      buttonAction: () =>
          Navigator.pushNamed(context, '/create').then((_) => getReminders()),
      buttonType: ButtonType.create,
      child: Column(
        children: [
          Header(
            title: 'Inicio',
            primaryIcon: FontAwesomeIcons.bars,
            primaryAction: (() => print('')),
          ),
          const Quote(
            quote: 'We first make our habits, \nand then our habits\nmake us.',
            author: 'anonynomous',
          ),
          History(
            habits: habits,
            reload: getReminders,
          ),
        ],
      ),
    );
  }
}
