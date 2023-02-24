import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/enums/buttonColor.dart';
import 'package:monumental/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() action;
  final String title;
  final ButtonColor? color;
  final bool? isDisabled;
  CustomButton({
    Key? key,
    required this.action,
    this.isDisabled,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: isDisabled == true ? null : action,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: isDisabled == true
              ? Colors.grey
              : color == ButtonColor.terciary
                  ? Colors.white
                  : color == ButtonColor.secondary
                      ? kOrangeColor.withOpacity(0.2)
                      : kOrangeColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.manrope(
                fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
