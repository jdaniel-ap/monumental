import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class Quote extends StatelessWidget {
  final String quote;
  final String author;
  const Quote({Key? key, required this.quote, required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      width: double.infinity,
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(children: [
        Positioned(
          right: -30,
          top: -40,
          child: Image.asset(
            'images/monumental_person.png',
            width: 235,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote..toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Klasik',
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '- ${author.toUpperCase()}',
                style: GoogleFonts.manrope(
                  fontSize: 12.0,
                  color: kFontColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
