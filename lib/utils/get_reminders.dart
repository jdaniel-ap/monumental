import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monumental/models/habit.dart';
import 'package:monumental/models/reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HabitsData {
  _listData(BuildContext? context) async {
    final prefs = await SharedPreferences.getInstance();
    final storedReminders = prefs.getString('@monumental_reminders') ?? '[]';

    List parseReminders = json.decode(storedReminders);
    List<Habit> habitList = parseReminders
        .map(
          (e) => Habit(
            id: e['id'],
            activeNotifications: e['activeNotifications'],
            title: e['title'],
            frencuency: e['frecuency'].cast<int>(),
            reminders: e['reminders'].cast<Reminder>(),
          ),
        )
        .toList();

    if (context != null) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;

      Habit habitFinder = habitList.firstWhere((h) => h.id == arguments['id']);

      return habitFinder;
    }

    return habitList;
  }

  Future<Habit> getHabit(BuildContext context) async {
    return await _listData(context);
  }

  Future<List<Habit>> getHabitList() async {
    return await _listData(null);
  }
}
