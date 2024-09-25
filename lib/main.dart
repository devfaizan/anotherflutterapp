import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:orhan_ui/screens/onboardingone.dart';
import 'package:orhan_ui/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool('seenOnboarding');
    return seenOnboarding == null || seenOnboarding == false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orhan UI',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: _checkIfFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            bool isFirstTime = snapshot.data!;
            return isFirstTime ? const OneOnBoard() : const RegisterScreen();
          } else {
            return const OneOnBoard();
          }
        },
      ),
    );
  }
}
