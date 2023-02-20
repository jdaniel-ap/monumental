import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/screens/create_screen.dart';
import 'package:monumental/screens/home_screen.dart';
import 'package:monumental/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      defaultColor: Color(0xFF9D50DD),
      ledColor: Colors.white,
      enableLights: true,
      enableVibration: true,
      playSound: true,
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monumental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: kFontColor,
              ),
        ),
        scaffoldBackgroundColor: kBackground,
      ),
      initialRoute: '/',
      routes: {
        '/': ((context) => HomeScreen()),
        '/create': (context) => CreateScreen(),
      },
    );
  }
}
