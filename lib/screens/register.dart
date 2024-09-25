import 'package:flutter/material.dart';
import 'package:orhan_ui/screens/login.dart';
import 'package:orhan_ui/utils/misc.dart';
import 'package:orhan_ui/widgets/inputfield.dart';
import 'package:intl/intl.dart';
import 'package:orhan_ui/widgets/primarybutton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String genderSelected = "male";

  @override
  Widget build(BuildContext context) {
    final heightContext = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Register",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 28.0,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: heightContext * 0.001,
            ),
            const Center(
              child: Text(
                "Yourself Now!",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 28.0,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: heightContext * 0.03,
            ),
            const Center(
              child: Text(
                "Fill The Form To Get Going",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 14.0,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                ),
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
              controller: nameController,
              hintText: "Name",
              preIcon: Icons.person,
            ),
            SizedBox(
              height: heightContext * 0.02,
            ),
            InputField(
              controller: passController,
              hintText: "Password",
              preIcon: Icons.password,
              obscureText: true,
            ),
            SizedBox(
              height: heightContext * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 20.0),
              child: TextFormField(
                style: const TextStyle(
                  color: colorWhite,
                  fontFamily: fontFamily,
                ),
                textAlign: TextAlign.center,
                controller: dateController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: colorWhite,
                    size: 25.0,
                  ),
                  hintText: "Select Date",
                  hintStyle: TextStyle(
                    color: colorGrey,
                    fontSize: 14.0,
                    fontFamily: fontFamily,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: colorWhite,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: colorWhite,
                    ),
                  ),
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());
                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100)))!;
                  String dateFormatter = date.toIso8601String();
                  DateTime dt = DateTime.parse(dateFormatter);
                  var formatter = DateFormat('dd-MMMM-yyyy');
                  setState(() {
                    dateController.text = formatter.format(dt);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightContext * 0.01,
                  ),
                  const Text(
                    "Gender",
                    style: TextStyle(
                      color: colorWhite,
                      letterSpacing: 1,
                      fontSize: 14.0,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: heightContext * 0.01,
                  ),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          groupValue: genderSelected,
                          activeColor: colorWhite,
                          title: const Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorWhite,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: 'male',
                          onChanged: (val) {
                            setState(() {
                              genderSelected = val.toString();
                            });
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          groupValue: genderSelected,
                          activeColor: colorWhite,
                          title: const Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: colorWhite,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: 'female',
                          onChanged: (val) {
                            setState(() {
                              genderSelected = val.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightContext * 0.03,
            ),
            PrimaryButton(
              text: "Sign Up",
              onPressed: () {
                if (isValidated()) {
                  print("Data is Validated");
                  // goto home
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
                  "Already have an account? ",
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
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    " Sign In ",
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
    if (nameController.text.isEmpty) {
      showScaffold(context, "Please Fill Name Field");
      return false;
    }
    if (passController.text.isEmpty) {
      showScaffold(context, "Please Choose a Pasword");
      return false;
    }
    if (dateController.text.isEmpty) {
      showScaffold(context, "Please Select a Date");
      return false;
    }
    return true;
  }
}
