import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() action;
  bool? isDisabled;
  CustomButton({Key? key, required this.action, this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: isDisabled == true ? (() => null) : action,
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: isDisabled == true ? Colors.grey : kOrangeColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: Text(
              'Adicionar',
              style: GoogleFonts.manrope(
                  fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
