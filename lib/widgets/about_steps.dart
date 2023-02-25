import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/utils/colors.dart';

class AboutSteps extends StatelessWidget {
  AboutSteps({super.key});

  List about = [
    'Es gratis y libre de molesta publicidad',
    'Interfaz amigable e intuitiva',
    'Otra cosa que voy a pensar despues',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Sobre monumental habits',
              style: GoogleFonts.manrope(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...about.asMap().entries.map((e) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: kOrangeColor.withOpacity(0.2)),
                  ),
                ),
                child: Row(children: [
                  Container(
                    alignment: Alignment.center,
                    width: 25.0,
                    height: 25.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.5)),
                      color: kOrangeColor,
                    ),
                    child: Image.asset(
                      'images/check.png',
                      width: 11.0,
                      height: 12.0,
                    ),
                  ),
                  Text(e.value),
                ]),
              )),
        ]),
      ),
    );
  }
}
