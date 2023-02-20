import 'package:flutter/material.dart';
import 'package:monumental/widgets/custom_button.dart';
import 'package:monumental/widgets/modal.dart';

class RemindersModal extends StatelessWidget {
  const RemindersModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBase(
      children: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Row(
                children: [CustomButton(action: () {})],
              )
            ],
          )),
    );
  }
}
