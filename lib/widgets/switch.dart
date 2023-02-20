import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool isActive;
  const CustomSwitch({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: isActive
            ? kOrangeColor.withOpacity(0.2)
            : kFontColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.5,
          vertical: 0.0,
        ),
        child: Row(
          textDirection: isActive ? TextDirection.ltr : TextDirection.rtl,
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                isActive ? 'Si' : 'No',
                style: GoogleFonts.manrope(
                  color: isActive ? kOrangeColor : kFontColor,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              width: 22.0,
              height: 22.0,
              decoration: BoxDecoration(
                color: isActive ? kOrangeColor : kFontColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(11),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12, //New
                    blurRadius: 2.0,
                    offset: Offset(1, 2),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
