import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/cardviewshadow.dart';
import 'package:orhan_ui/utils/circleview.dart';
import 'package:orhan_ui/utils/misc.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int imageNumber = 1;
  List<int> generateRandomNumber = [];
  void randomNumber() {
    if (generateRandomNumber.length == 5) {
      generateRandomNumber.clear();
    }
    int randomNumber;
    do {
      randomNumber = Random().nextInt(5) + 1;
    } while (generateRandomNumber.contains(randomNumber));
    generateRandomNumber.add(randomNumber);
    setState(() {
      imageNumber = randomNumber;
    });
  }

  List<String> animalDetails = [
    "Majestic and wise, the gentle elephant roams",
    "Roar with the king of the jungle, the lion",
    "Meet the adorable and bamboo-loving panda",
    "Leap into adventure with the agile dado",
    "Dive into the depths with colorful fish",
  ];
  List<String> animalNames = [
    "Elephant",
    "Dolpine",
    "Panda",
    "Dado",
    "Lion",
  ];

  @override
  Widget build(BuildContext context) {
    final heightContext = MediaQuery.of(context).size.height;
    final widthContext = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorGreyLight,
      body: Center(
        child: SizedBox(
          width: widthContext * 0.8,
          height: heightContext * 0.6,
          child: Stack(
            children: [
              const CardViewShadow(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    colors: [
                      colorBlueDark,
                      colorBlueLight,
                      colorBlueMedium,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animalNames[imageNumber - 1],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 52,
                        color: colorWhite,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 32.0,
                      ),
                      child: Text(
                        animalDetails[imageNumber - 1],
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: colorWhite,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Stack(
                      children: [
                        const CircleView(),
                        Positioned.fill(
                          child: Image.asset('assets/image-$imageNumber.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        randomNumber();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        elevation: 4,
                        backgroundColor: colorWhite,
                      ),
                      child: const Text(
                        "Explore More",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightContext * 0.02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
