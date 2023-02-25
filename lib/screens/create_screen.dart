import 'dart:convert';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/enums/buttonColor.dart';
import 'package:monumental/models/habit.dart';
import 'package:monumental/models/reminder.dart';
import 'package:monumental/screens/main_screen.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/utils/constans.dart';
import 'package:monumental/widgets/create_instructions.dart';
import 'package:monumental/widgets/custom_button.dart';
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
  final List<Reminder> _reminders = [];
  final TextEditingController _controller = TextEditingController();

  Future _saveReminder() async {
    List<Reminder> formatedReminders = [];
    final prefs = await SharedPreferences.getInstance();

    backToHome() {
      Navigator.pop(context);
    }

    Future<void> notify() async {
      for (var weekday in _frencuency) {
        for (var index = 0; index < _reminders.length; index++) {
          var reminder = _reminders[index];
          if (reminder.isActive) {
            var hour = reminder.date.hour;
            var minute = reminder.date.minute;
            var id = Random().nextInt(100000);

            await AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: id,
                channelKey: 'monumental_basic_channel',
                title:
                    'Tienes un recordatorio! ${Emojis.time_watch}${Emojis.person_activity_person_running}',
                body: '$_title, es ahora!',
                icon: 'resource://drawable/notification_icon',
                color: kFontColor,
                notificationLayout: NotificationLayout.BigPicture,
                bigPicture: 'asset://images/quote_3.png',
              ),
              schedule: NotificationCalendar(
                weekday: weekday,
                hour: hour,
                minute: minute,
                second: 0,
                millisecond: 0,
                repeats: true,
                allowWhileIdle: true,
                timeZone: AwesomeNotifications.localTimeZoneIdentifier,
              ),
            );
            formatedReminders.add(Reminder(
                isActive: reminder.isActive,
                date: reminder.date,
                weekday: weekday,
                id: id));
          }
        }
      }
    }

    if (_activeNotifications) {
      await notify();
    }
    final storedReminders =
        json.decode(prefs.getString('@monumental_reminders') ?? '[]');
    final stringifyReminder = json.encode(
      [
        ...storedReminders,
        Habit(
          activeNotifications: _activeNotifications,
          title: _title,
          frencuency: _frencuency,
          reminders: formatedReminders,
        ).toJson(),
      ],
      toEncodable: (object) {
        if (object is DateTime) {
          return object.toIso8601String();
        }
        return object;
      },
    );

    print(storedReminders);

    await prefs.setString(
      '@monumental_reminders',
      stringifyReminder,
    );

    backToHome();
  }

  List<String> weekDays = ['lun', 'mar', 'mie', 'jue', 'vie', 'sab', 'dom'];
  void handleHabitTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  void addReminder(Reminder reminder) {
    setState(() {
      _reminders.add(reminder);
    });
  }

  Future handleNotications() async {
    final prefs = await SharedPreferences.getInstance();
    if (_activeNotifications) {
      Navigator.of(context).push(DismissibleDialog());
    }
    setState(() {
      _activeNotifications = !_activeNotifications;
    });
    await AwesomeNotifications().cancelAll();
    prefs.clear();
  }

  void updateReminder(int index, isActive) {
    _reminders[index].isActive = isActive;
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

class DismissibleDialog<T> extends PopupRoute<T> {
  @override
  Color? get barrierColor => Colors.black.withAlpha(0x50);

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismissible Dialog';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Center(
      // Provide DefaultTextStyle to ensure that the dialog's text style
      // matches the rest of the text in the app.
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!,
        // UnconstrainedBox is used to make the dialog size itself
        // to fit to the size of the content.
        child: UnconstrainedBox(
          child: Container(
            height: 450.0,
            width: MediaQuery.of(context).size.width / 1.1,
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'images/monumental_progress.png',
                    width: 250.0,
                  ),
                ),
                const Text('notificaciones\ndesactivadas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Klasik',
                      fontSize: 24.0,
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'La aplicacion no podra enviarte\navisos sobre este habito.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kFontColor.withOpacity(0.6)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  color: ButtonColor.secondary,
                  action: () => Navigator.pop(context),
                  title: 'Continuar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
