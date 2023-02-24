import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental/screens/main_screen.dart';
import 'package:monumental/utils/constans.dart';
import 'package:monumental/widgets/header.dart';
import 'package:monumental/widgets/history.dart';
import 'package:monumental/widgets/quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow notifications'),
            content: const Text('Our apps would  like send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Permitir',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context));
                },
                child: const Text(
                  'No permitir',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      buttonAction: () => Navigator.pushNamed(context, '/create'),
      buttonType: ButtonType.create,
      child: Column(
        children: [
          Header(
            title: 'Inicio',
            icon: FontAwesomeIcons.bars,
            onTap: (() => print('')),
          ),
          const Quote(
            quote: 'We first make our habits, \nand then our habits\nmake us.',
            author: 'anonynomous',
          ),
          History(),
        ],
      ),
    );
  }
}
