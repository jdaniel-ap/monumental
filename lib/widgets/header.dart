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
          Container(
            width: 45.0,
            height: 45.0,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: kFontColor.withOpacity(0.1),
            ),
            child: MaterialButton(
              onPressed: primaryAction,
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              child: Center(
                child: Icon(
                  primaryIcon,
                  size: 20.0,
                  color: kFontColor,
                ),
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
          Container(
            width: 45.0,
            height: 45.0,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: secondaryAction != null
                  ? kFontColor.withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: MaterialButton(
              onPressed: secondaryAction,
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              child: Center(
                child: secondaryIcon != null && secondaryAction != null
                    ? secondaryIcon
                    : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
