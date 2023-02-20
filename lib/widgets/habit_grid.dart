import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/utils/dates.dart';

class HabitGrid extends StatelessWidget {
  final String name;
  final Color color;
  final bool? isHeader;

  DateTime firstDayWeek = GridDates().firstDateOfTheWeek(DateTime.now());

  List<String> daysOfTheWeek = [
    'Lun',
    'Mar',
    'Mie',
    'Jue',
    'Vie',
    'Sab',
    'Dom'
  ];

  HabitGrid({Key? key, required this.name, required this.color, this.isHeader})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 20.0, right: 2.0),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            width: 140.0,
            margin: const EdgeInsets.only(right: 3.0),
            decoration: BoxDecoration(
              color: isHeader == null ? Colors.white : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 6.0),
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: GoogleFonts.manrope(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 60.0,
            margin: const EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
                color: isHeader != null ? Colors.transparent : Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Row(
                children: [1, 2, 3, 4, 5, 6, 7]
                    .map((e) => Container(
                          height: 46.0,
                          width: 46.0,
                          margin: const EdgeInsets.only(right: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: isHeader != null
                                ? Colors.white
                                : color.withOpacity(0.2),
                          ),
                          child: Center(
                            child: isHeader != null
                                ? SizedBox(
                                    height: 38.0,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            daysOfTheWeek[(e - 1)]
                                                .toUpperCase(),
                                            style: GoogleFonts.manrope(
                                              fontSize: 10.0,
                                              color:
                                                  kFontColor.withOpacity(0.5),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${firstDayWeek.day + e - 1}',
                                            style: GoogleFonts.manrope(
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ]),
                                  )
                                : Container(
                                    height: 42.0,
                                    width: 42.0,
                                    decoration: BoxDecoration(
                                      color: e % 2 == 0
                                          ? Colors.transparent
                                          : color,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
