import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/widgets/switch.dart';

class HandleReminders extends StatelessWidget {
  final bool activeNotifications;
  final void Function() handleNotifications;
  HandleReminders(
      {Key? key,
      required this.activeNotifications,
      required this.handleNotifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleNotifications,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
              horizontal: 16.0,
              vertical: 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notificaciones',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
                CustomSwitch(isActive: activeNotifications)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
