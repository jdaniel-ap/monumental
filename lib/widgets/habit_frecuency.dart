import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class HabitFrecuency extends StatelessWidget {
  final List<int> selectedDays;
  final void Function(int) handleFrecuency;
  HabitFrecuency(
      {Key? key, required this.selectedDays, required this.handleFrecuency})
      : super(key: key);
  final List<String> _weekDays = [
    'lun',
    'mar',
    'mie',
    'jue',
    'vie',
    'sab',
    'dom'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        height: 125.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  Text(
                    'Frecuencia de habito',
                    style: GoogleFonts.manrope(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: _weekDays
                    .asMap()
                    .entries
                    .map(
                      (item) => Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            top: BorderSide(
                              color: kOrangeColor.withOpacity(0.15),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: kOrangeColor.withOpacity(0.15),
                              width: 1.0,
                            ),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  item.value.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: kFontColor.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    handleFrecuency(item.key + 1);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 33.0,
                                    width: 33.0,
                                    decoration: BoxDecoration(
                                      color: kOrangeColor.withOpacity(0.4),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(11.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 31,
                                      width: 31,
                                      decoration: BoxDecoration(
                                        color:
                                            selectedDays.contains(item.key + 1)
                                                ? kOrangeColor
                                                : Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(11.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
