import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  const Header({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
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
              onTap();
            }),
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: kFontColor.withOpacity(0.1),
              ),
              child: Icon(
                icon,
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
          IconButton(
            onPressed: () {},
            icon: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
