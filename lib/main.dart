import 'package:escrow_app/Screens/homescreen.dart';
import 'package:escrow_app/Screens/receivescreen.dart';
import 'package:escrow_app/Screens/sendscreen.dart';
import 'package:escrow_app/Screens/settingscreen.dart';
import 'package:escrow_app/Screens/transactionscreen.dart';
import 'package:escrow_app/Screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:escrow_app/utils/routes.dart';
import 'Screens/splashscreen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/dashboard': (context) => HomeScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/send': (context) => SendScreen(),
        '/recieve': (context) => RecieveScreen(),
        '/settings': (context) => SettingScreen(),
        '/transaction': (context) => TransactionScreen(),
      },
    );
  }
}
