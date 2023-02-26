import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData primaryIcon;
  final Widget? secondaryIcon;
  final void Function() primaryAction;
  final void Function()? secondaryAction;
  const Header({
    Key? key,
    required this.title,
    required this.primaryIcon,
    required this.primaryAction,
    this.secondaryAction,
    this.secondaryIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (() {
              primaryAction();
            }),
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: kFontColor.withOpacity(0.1),
              ),
              child: Icon(
                primaryIcon,
                size: 20.0,
                color: kFontColor,
              ),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.manrope(shadows: [
              Shadow(
                offset: const Offset(1.0, 3.0),
                blurRadius: 3.0,
                color: Colors.black26.withOpacity(0.2),
              ),
            ], fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: secondaryAction,
            child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: secondaryAction != null
                      ? kFontColor.withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Center(
                  child: secondaryIcon != null && secondaryAction != null
                      ? secondaryIcon
                      : const SizedBox(),
                )),
          ),
        ],
      ),
    );
  }
}
