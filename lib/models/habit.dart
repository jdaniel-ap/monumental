import 'package:monumental/models/day_check.dart';
import 'package:monumental/models/reminder.dart';

class Habit {
  String id;
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
    required this.id,
    this.daysCheck,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'activeNotifications': activeNotifications,
        'title': title,
        'frecuency': frencuency,
        'reminders': reminders.map((e) => e.toJson()).toList(),
        'daysCheck': daysCheck?.map((e) => e.toJson()).toList()
      };
}
