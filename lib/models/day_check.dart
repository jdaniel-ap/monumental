class DayCheck {
  late DateTime? day;
  late bool? checked;

  DayCheck({this.day, this.checked});

  Map<String, dynamic> toJson() => {
        'day': day,
        'bool': checked,
      };
}
