import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monumental/screens/create_screen.dart';
import 'package:monumental/screens/habit_dashboard.dart';
import 'package:monumental/screens/home_screen.dart';
import 'package:monumental/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/notification_icon',
      [
        NotificationChannel(
          channelGroupKey: 'monumental_basic_channel_group',
          channelKey: 'monumental_basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        )
      ],
      debug: true);
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
        '/dashboard': (context) => HabitDashboard(),
      },
    );
  }
}
