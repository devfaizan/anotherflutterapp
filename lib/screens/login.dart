import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/card.dart';
import 'package:orhan_ui/screens/register.dart';
import 'package:orhan_ui/utils/misc.dart';
import 'package:orhan_ui/widgets/inputfield.dart';
import 'package:orhan_ui/widgets/primarybutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final heightContext = MediaQuery.of(context).size.height;
    final widthContext = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightContext * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightContext * 0.003,
                    ),
                    Container(
                      width: 20,
                      height: 2.0,
                      decoration: const BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: widthContext * 0.03,
                ),
                const Text(
                  "Login Into App!",
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 25.0,
                    fontFamily: fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightContext * 0.03,
            ),
            const Text(
              "Fill up details below!",
              style: TextStyle(
                color: colorWhite,
                fontSize: 14.0,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: heightContext * 0.06,
            ),
            InputField(
              controller: emailController,
              hintText: "Email",
              preIcon: Icons.email,
            ),
            SizedBox(
              height: heightContext * 0.02,
            ),
            InputField(
              controller: passController,
              hintText: "Password]",
              preIcon: Icons.password,
            ),
            SizedBox(
              height: heightContext * 0.06,
            ),
            PrimaryButton(
              text: "Sign In",
              onPressed: () {
                if (isValidated()) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardView(),
                      ),
                      (route) => false);
                }
              },
            ),
            SizedBox(
              height: heightContext * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: colorWhite,
                    fontFamily: fontFamily,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    " Sign Up ",
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 15.0,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  " here",
                  style: TextStyle(
                    color: colorWhite,
                    fontFamily: fontFamily,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isValidated() {
    if (emailController.text.isEmpty) {
      showScaffold(context, "Please Fill Enail Field");
      return false;
    }

    if (passController.text.isEmpty) {
      showScaffold(context, "Please Choose a Pasword");
      return false;
    }
    return true;
  }
}
