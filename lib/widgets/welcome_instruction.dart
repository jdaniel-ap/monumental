import 'package:flutter/material.dart';
import 'package:monumental/utils/colors.dart';

class WelcomeInstructions extends StatelessWidget {
  const WelcomeInstructions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 140.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Aun no tienes ningun habito\nque tal si creamos uno?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Klasik', fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15.0,
            width: 20.0,
            child: Image.asset(
              'images/draw_arrow.png',
              width: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
