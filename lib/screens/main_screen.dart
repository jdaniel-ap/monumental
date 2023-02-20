import 'package:flutter/material.dart';
import 'package:monumental/utils/colors.dart';
import 'package:monumental/utils/constans.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final void Function() buttonAction;
  final bool? buttonDisabled;
  final ButtonType buttonType;
  const MainScreen({
    Key? key,
    required this.child,
    required this.buttonType,
    this.buttonDisabled,
    required this.buttonAction,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.scaleDown,
                alignment: Alignment(0, 1.0),
              ),
            ),
          ),
          widget.child,
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: widget.buttonDisabled == true
              ? Colors.grey.withOpacity(0.3)
              : kOrangeColor.withOpacity(0.3),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: widget.buttonDisabled == true
                  ? Colors.grey.withOpacity(0.6)
                  : kOrangeColor,
            ),
            child: Center(
              child: Image.asset(
                'images/${widget.buttonType == ButtonType.create ? 'plus' : 'check'}.png',
                width: 20,
              ),
            ),
          ),
          onPressed: () {
            if (widget.buttonDisabled == true) {
              return;
            }

            widget.buttonAction();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
