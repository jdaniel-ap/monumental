import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  const Instruction({super.key});

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
      child: Image.asset(
        'images/profile.png',
        width: 20.0,
        height: 20.0,
      ),
    );
  }
}
