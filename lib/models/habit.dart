import 'package:monumental/models/reminder.dart';

class Habit {
  bool activeNotifications;
  String title;
  List<int> frencuency;
  List<Reminder> reminders;

  Habit({
    required this.activeNotifications,
    required this.title,
    required this.frencuency,
    required this.reminders,
  });

  Map<String, dynamic> toJson() => {
        'activeNotifications': activeNotifications,
        'title': title,
        'frecuency': frencuency,
        'reminders': reminders.map((e) => e.toJson()).toList(),
      };
}
