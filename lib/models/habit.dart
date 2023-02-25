import 'package:monumental/models/day_check.dart';
import 'package:monumental/models/reminder.dart';

class Habit {
  bool activeNotifications;
  String title;
  List<int> frencuency;
  List<Reminder> reminders;
  List<DayCheck>? daysCheck;

  Habit({
    required this.activeNotifications,
    required this.title,
    required this.frencuency,
    required this.reminders,
    this.daysCheck,
  });

  Map<String, dynamic> toJson() => {
        'activeNotifications': activeNotifications,
        'title': title,
        'frecuency': frencuency,
        'reminders': reminders.map((e) => e.toJson()).toList(),
        'daysCheck': daysCheck?.map((e) => e.toJson()).toList()
      };
}
