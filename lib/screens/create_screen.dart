import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental/screens/main_screen.dart';
import 'package:monumental/utils/constans.dart';
import 'package:monumental/widgets/create_instructions.dart';
import 'package:monumental/widgets/habit_frecuency.dart';
import 'package:monumental/widgets/habit_title.dart';
import 'package:monumental/widgets/handle_reminders.dart';
import 'package:monumental/widgets/header.dart';
import 'package:monumental/widgets/schedules.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  bool _activeNotifications = true;
  String _title = '';
  final List<int> _frencuency = [];
  final List _reminders = [];
  final TextEditingController _controller = TextEditingController();

  Future _saveReminder() async {
    final prefs = await SharedPreferences.getInstance();

    _backToHome() {
      Navigator.pop(context);
    }

    _notify() {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: 'Tienes un recordatorio!',
            body: 'Pasear al perro, es ahora!'),
      );
    }

    final storedReminders =
        json.decode(prefs.getString('@monumental_reminders') ?? '[]');

    final stringifyReminder = json.encode(
      [
        ...storedReminders,
        {
          "title": _title,
          "reminders": _reminders,
          "frecuency": _frencuency,
          "notifications": _activeNotifications
        }
      ],
      toEncodable: (object) {
        if (object is DateTime) {
          return object.toIso8601String();
        }
        return object;
      },
    );

    await prefs.setString(
      '@monumental_reminders',
      stringifyReminder,
    );
    _notify();
    // _backToHome();
  }

  List<String> weekDays = ['lun', 'mar', 'mie', 'jue', 'vie', 'sab', 'dom'];
  void handleHabitTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  void addReminder(Map<String, Object> reminder) {
    setState(() {
      _reminders.add(reminder);
    });
  }

  void handleNotications() {
    setState(() {
      _activeNotifications = !_activeNotifications;
    });
  }

  void updateReminder(int index, isActive) {
    _reminders[index] = {..._reminders[index], 'isActive': isActive};
  }

  void removeReminder(int index) {
    _reminders.removeAt(index);
  }

  void handleFrencuency(int day) {
    setState(() {
      if (_frencuency.contains(day)) {
        int index = _frencuency.indexOf(day);
        _frencuency.removeAt(index);
      } else {
        _frencuency.add(day);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MainScreen(
      buttonAction: _saveReminder,
      buttonDisabled:
          (_title.isEmpty || _frencuency.isEmpty || _reminders.isEmpty),
      buttonType: ButtonType.confirm,
      child: Column(
        children: [
          Header(
            title: 'Crear habito',
            icon: FontAwesomeIcons.arrowLeft,
            onTap: () => Navigator.pop(context),
          ),
          HabitTitle(
            habitName: _title,
            controller: _controller,
            handleHabitTitle: handleHabitTitle,
          ),
          HabitFrecuency(
            selectedDays: _frencuency,
            handleFrecuency: handleFrencuency,
          ),
          Schedules(
            reminders: _reminders,
            addReminder: addReminder,
            updateReminder: updateReminder,
            removeReminder: removeReminder,
          ),
          HandleReminders(
            activeNotifications: _activeNotifications,
            handleNotifications: handleNotications,
          ),
          CreateInstructions(
            hasTitle: _title.isNotEmpty,
            hasFrecuency: _frencuency.isNotEmpty,
            hasReminders: _reminders.isNotEmpty,
            hasNotifications: _activeNotifications,
          ),
        ],
      ),
    );
  }
}
