import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _selectedDate;
  List<DateTime> _daysInMonth = [];
  final List<String> _weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _daysInMonth = _getDaysInMonth(_selectedDate);
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
    DateTime lastDayOfMonth =
        DateTime(month.year, month.month + 1, 0).add(const Duration(days: 1));
    int daysInMonth = lastDayOfMonth.difference(firstDayOfMonth).inDays;
    return List.generate(
        daysInMonth, (index) => firstDayOfMonth.add(Duration(days: index)));
  }

  Widget _buildWeekDays(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        _weekDays.length,
        (index) => Container(
          alignment: Alignment.center,
          child: Text(
            _weekDays[index].toUpperCase(),
            style: GoogleFonts.manrope(
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
                color: kFontColor.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }

  Widget _buildDays(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      childAspectRatio: 0.7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        _daysInMonth.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = _daysInMonth[index];
              _daysInMonth = _getDaysInMonth(_selectedDate);
            });
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: [
                  Text(
                    '${_daysInMonth[index].day}',
                    style: GoogleFonts.manrope(
                        color: kFontColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: kOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  )
                ],
              )),
        ),
      ),
    );
  }

  bool _isSelected(DateTime day) {
    return _selectedDate.year == day.year &&
        _selectedDate.month == day.month &&
        _selectedDate.day == day.day;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        margin: const EdgeInsets.only(top: 20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          children: [
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = DateTime(
                          _selectedDate.year, _selectedDate.month - 1, 1);
                      _daysInMonth = _getDaysInMonth(_selectedDate);
                    });
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = DateTime(
                          _selectedDate.year, _selectedDate.month + 1, 1);
                      _daysInMonth = _getDaysInMonth(_selectedDate);
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            _buildWeekDays(context),
            _buildDays(context),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
