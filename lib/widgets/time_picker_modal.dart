import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/widgets/modal.dart';

class TimePickerModal extends StatelessWidget {
  void Function(DateTime) addReminder;
  void Function() cancelNewReminder;
  late DateTime reminder = DateTime.now();

  final TextStyle _buttonTextStyle = GoogleFonts.manrope(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: kOrangeColor,
  );
  TimePickerModal(
      {Key? key, required this.addReminder, required this.cancelNewReminder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBase(
      children: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kOrangeColor.withOpacity(0.20),
                  width: 1.0,
                ),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: (() {
                    cancelNewReminder();
                  }),
                  child: Text(
                    'Cancelar',
                    style: _buttonTextStyle,
                  ),
                ),
                Text(
                  'Recordatorio',
                  style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MaterialButton(
                  onPressed: (() {
                    addReminder(reminder);
                  }),
                  child: Text(
                    'Salvar',
                    style: _buttonTextStyle,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TimePickerSpinner(
              is24HourMode: false,
              spacing: 40,
              itemHeight: 80,
              isForce2Digits: true,
              normalTextStyle: GoogleFonts.manrope(
                color: kFontColor.withOpacity(0.4),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              highlightedTextStyle: GoogleFonts.manrope(
                  color: kFontColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
              onTimeChange: (time) {
                reminder = time;
              },
            ),
          ),
        ],
      ),
    );
  }
}
