import 'package:flutter/material.dart';
import 'package:monumental/utils/colors.dart';

class HabitTitle extends StatelessWidget {
  final String habitName;
  final TextEditingController controller;
  final void Function(String) handleHabitTitle;
  const HabitTitle({
    Key? key,
    required this.habitName,
    required this.controller,
    required this.handleHabitTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (e) {
                handleHabitTitle(e);
              },
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Introduce el nombre del habito',
                  hintStyle: TextStyle(
                      color: kFontColor.withOpacity(0.5), fontSize: 14.0)),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              handleHabitTitle(controller.text);

              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'images/read.png',
                    width: 33.0,
                  ),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Image.asset(
                      'images/plus_small.png',
                      width: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
