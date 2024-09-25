import 'package:flutter/material.dart';
import 'package:orhan_ui/screens/onboardingtwo.dart';
import 'package:orhan_ui/screens/register.dart';
import 'package:orhan_ui/utils/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OneOnBoard extends StatefulWidget {
  const OneOnBoard({super.key});

  @override
  State<OneOnBoard> createState() => _OneOnBoardState();
}

class _OneOnBoardState extends State<OneOnBoard> {
  Offset imageOffset = Offset.zero;
  double buttonOffset = 0.0;
  String textTitle = "Deliver";

  @override
  void initState() {
    super.initState();
    _checkIfOnboardingSeen();
  }

  Future<void> _checkIfOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool('seenOnboarding');
    if (seenOnboarding != null && seenOnboarding == true) {
      _goToRegisterScreen();
    }
  }

  Future<void> _completeOnboading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TwoOnboard()),
    );
  }

  void _goToRegisterScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final heightContext = MediaQuery.of(context).size.height;
    final widthContext = MediaQuery.of(context).size.width;
    double buttonWidth = widthContext - 80;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Text(
                textTitle,
                style: const TextStyle(
                  color: colorWhite,
                  fontSize: 60,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Pipe bombs anywhere",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 18,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const Spacer(),
            Transform(
              transform: Matrix4.translationValues(
                imageOffset.dx,
                0,
                0,
              )..rotateZ(
                  (imageOffset.dx / 20) * 3.14 / 180,
                ),
              child: GestureDetector(
                onPanUpdate: (details) {
                  if (imageOffset.dx.abs() <= 120) {
                    setState(() {
                      imageOffset = Offset(
                        imageOffset.dx + details.delta.dx,
                        0,
                      );
                      textTitle = "Drop";
                    });
                  }
                },
                onPanEnd: (_) {
                  setState(() {
                    imageOffset = Offset.zero;
                    textTitle = "Deliver";
                  });
                },
                child: SizedBox(
                  width: 350,
                  height: 350,
                  child: Image.asset('assets/character-1.png'),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0 && buttonOffset <= buttonWidth - 80) {
                  setState(() {
                    buttonOffset += details.delta.dx;
                  });
                }
              },
              onPanEnd: (_) {
                if (buttonOffset > buttonWidth / 2) {
                  setState(() {
                    buttonOffset = buttonWidth - 80;
                  });
                  _completeOnboading();
                } else {
                  setState(() {
                    buttonOffset = 0.0;
                  });
                }
              },
              child: Container(
                width: buttonWidth,
                height: heightContext * 0.08,
                decoration: BoxDecoration(
                  color: colorWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      width: buttonOffset + 80,
                      height: widthContext * 0.2,
                      decoration: BoxDecoration(
                        color: colorAmber,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: widthContext * 0.18,
                          height: widthContext * 0.16,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.chevron_right,
                              size: 40.0,
                              color: colorWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          "Get Going",
                          style: TextStyle(
                            color: colorWhite,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
