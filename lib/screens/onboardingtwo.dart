import 'package:flutter/material.dart';
import 'package:orhan_ui/screens/register.dart';
import 'package:orhan_ui/utils/circles.dart';
import 'package:orhan_ui/utils/misc.dart';
import 'package:orhan_ui/widgets/primarybutton.dart';

class TwoOnboard extends StatefulWidget {
  const TwoOnboard({super.key});

  @override
  State<TwoOnboard> createState() => _TwoOnboardState();
}

class _TwoOnboardState extends State<TwoOnboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
    );
    _controller.repeat(
      reverse: true,
    );
  }

  @override
  void dispose() {
    // Dispose of the AnimationController before calling super.dispose()
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightContext = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: heightContext * 0.05,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const AnimatingCircles(),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(0, _controller.value * -50),
                      child: Image.asset(
                        'assets/character-2.png',
                        width: 200,
                        height: 200,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: heightContext * 0.04,
            ),
            const Text(
              "We Deliver Like nobody else does",
              style: TextStyle(
                color: colorWhite,
                fontSize: 18,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: heightContext * 0.1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: onboardingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.check_circle,
                        color: colorAmber,
                      ),
                      title: Text(
                        onboardingList[index],
                        style: const TextStyle(
                          color: colorWhite,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            PrimaryButton(
              text: "Get Going",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                    (route) => false);
              },
              backcolor: colorAmber,
            ),
            SizedBox(
              height: heightContext * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  final List<String> onboardingList = [
    "Drop off location will be in news next morning.",
    "Big nose people will vanish.",
    "Less hassle more results.",
  ];
}
