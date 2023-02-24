import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/widgets/custom_button.dart';
import 'package:monumental/widgets/modal.dart';
import 'package:monumental/widgets/switch.dart';

class RemindersModal extends StatelessWidget {
  void Function() openTimePicker;
  void Function(int, bool) updateReminder;
  void Function(int) removeReminder;
  List reminders;

  RemindersModal({
    Key? key,
    required this.openTimePicker,
    required this.reminders,
    required this.updateReminder,
    required this.removeReminder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    reminders.sort((a, b) => a["date"].compareTo(b["date"]));
    var sortedReminders = reminders;

    Widget reminder(item) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              updateReminder(item.key, !item.value['isActive']);
            },
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 200,
              ),
              width: 115.0,
              height: 92.0,
              decoration: BoxDecoration(
                color: item.value['isActive']
                    ? kOrangeColor.withOpacity(0.2)
                    : kFontColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.jm().format(
                      item.value['date'],
                    ),
                    style: GoogleFonts.manrope(
                        color:
                            item.value['isActive'] ? kOrangeColor : kFontColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomSwitch(
                    isActive: item.value['isActive'],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -6.0,
            top: -6.0,
            child: GestureDetector(
              onTap: (() {
                removeReminder(item.key);
              }),
              child: Container(
                width: 23.0,
                height: 23.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 16.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }

    return ModalBase(
      children: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: reminders.isEmpty
                    ? [
                        Image.asset(
                          'images/monumental_time.png',
                          width: 300,
                        ),
                        const Text(
                          'No tienes recordatorios',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Klasik',
                          ),
                        )
                      ]
                    : [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              spacing: 7.0,
                              runSpacing: 10.0,
                              children: sortedReminders
                                  .asMap()
                                  .entries
                                  .map(
                                    (item) => reminder(item),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      title: 'Adicionar',
                      action: openTimePicker,
                      isDisabled: reminders.length == 9),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
