import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/widgets/no_reminders_modal.dart';
import 'package:monumental/widgets/time_picker_modal.dart';

class Schedules extends StatefulWidget {
  void Function(Map<String, Object>) addReminder;
  void Function(int, bool) updateReminder;
  void Function(int) removeReminder;
  List reminders;
  Schedules({
    super.key,
    required this.addReminder,
    required this.reminders,
    required this.updateReminder,
    required this.removeReminder,
  });

  @override
  State<Schedules> createState() => _Schedules();
}

class _Schedules extends State<Schedules> {
  bool isTimePickerEnable = false;

  Widget modalContent(BuildContext context, StateSetter setState) {
    return isTimePickerEnable
        ? TimePickerModal(
            addReminder: ((reminder) => {
                  setState((() => isTimePickerEnable = false)),
                  widget.addReminder({'isActive': true, 'date': reminder})
                }),
            cancelNewReminder: (() {
              setState((() => isTimePickerEnable = false));
            }),
          )
        : RemindersModal(
            reminders: widget.reminders,
            openTimePicker: (() {
              setState((() => isTimePickerEnable = true));
            }),
            updateReminder: ((index, isActive) {
              setState(() {
                widget.updateReminder(index, isActive);
              });
            }),
            removeReminder: ((index) {
              setState((() => widget.removeReminder(index)));
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            context: context,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return modalContent(context, setState);
              });
            },
          ).whenComplete(
            () => setState(
              () => isTimePickerEnable = false,
            ),
          );
        },
        child: Container(
          height: 48.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 0.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recordatorios',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        widget.reminders.isNotEmpty
                            ? '${widget.reminders.length}'
                            : '',
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          color: kOrangeColor,
                        ),
                      ),
                      Image.asset(
                        'images/arrow_right.png',
                        width: 20,
                        height: 25,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
