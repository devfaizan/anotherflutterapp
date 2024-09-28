import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/misc.dart';

class BubbleAnimation extends StatefulWidget {
  const BubbleAnimation({
    super.key,
  });
  @override
  State<BubbleAnimation> createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation>
    with SingleTickerProviderStateMixin {
  int randomCircles = Random().nextInt(9);

  bool isAnimating = false;

  double randomCoordinates(double containerSize) {
    return Random().nextDouble() * containerSize;
  }

  double randomSize() {
    return Random().nextInt(77) + 4.0;
  }

  void startAnimating() {
    isAnimating = true;
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        isAnimating = false;
        startAnimating();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startAnimating();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: List.generate(
          randomCircles,
          (index) {
            return AnimatedPositioned(
              curve: Curves.easeInOut,
              left: isAnimating
                  ? randomCoordinates(
                      MediaQuery.of(context).size.width * 0.8 - randomSize())
                  : 300 / 2,
              top: isAnimating
                  ? randomCoordinates(
                      MediaQuery.of(context).size.width * 0.8 - randomSize())
                  : 300 / 2,
              duration: const Duration(
                milliseconds: 2000,
              ),
              child: AnimatedOpacity(
                opacity: isAnimating ? 0.25 : 0.0,
                duration: const Duration(
                  milliseconds: 2000,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  width: isAnimating ? randomSize() : 0.0,
                  height: isAnimating ? randomSize() : 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorWhite,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
