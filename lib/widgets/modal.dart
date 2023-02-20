import 'package:flutter/material.dart';

class ModalBase extends StatelessWidget {
  final Widget children;
  const ModalBase({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: children,
    );
  }
}
