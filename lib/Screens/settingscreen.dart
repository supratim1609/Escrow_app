import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    // Set up listener for back button press
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Override the back button behavior
      WillPopScope(
        onWillPop: () async {
          // Navigate back to the HomeScreen
          Navigator.popUntil(context, ModalRoute.withName('/'));
          return true; // Return true to allow pop operation
        },
        child: Container(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushNamed(context, '/dashboard'),
        ),
        title: Text(
          'Settings Screen',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'This is the Settings Screen',
          style: GoogleFonts.poppins(
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
