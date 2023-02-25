class Reminder {
  bool isActive;
  DateTime date;
  int? id;
  int? weekday;

  Reminder({
    required this.isActive,
    required this.date,
    this.id,
    this.weekday,
  });

  Map<String, dynamic> toJson() => {
        'isActive': isActive,
        'date': date,
        'id': id,
        'weekday': weekday,
      };
}
