import 'package:flutter/material.dart';

class AnimatingCircles extends StatefulWidget {
  const AnimatingCircles({super.key});

  @override
  State<AnimatingCircles> createState() => _AnimatingCirclesState();
}

class _AnimatingCirclesState extends State<AnimatingCircles> {
  bool isFirstCircleAnimating = false;
  bool isSecondCircleAnimating = false;
  bool isThirdCircleAnimating = true;
  @override
  void initState() {
    super.initState();
    _showCircle();
  }

  void _showCircle() async {
    while (mounted) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (!mounted) return; // Ensure widget is still mounted
      setState(() {
        isSecondCircleAnimating = true;
      });
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (!mounted) return; // Ensure widget is still mounted
      setState(() {
        isFirstCircleAnimating = true;
      });
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (!mounted) return; // Ensure widget is still mounted
      setState(() {
        isFirstCircleAnimating = false;
        isThirdCircleAnimating = false;
      });
      if (!mounted) return; // Ensure widget is still mounted
      setState(() {
        isThirdCircleAnimating = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(250, 250),
      painter: CirclePainter(
        isThirdCircleAnimating,
        isSecondCircleAnimating,
        isFirstCircleAnimating,
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final bool isThirdCircleAnimating;
  final bool isSecondCircleAnimating;
  final bool isFirstCircleAnimating;

  CirclePainter(
    this.isThirdCircleAnimating,
    this.isSecondCircleAnimating,
    this.isFirstCircleAnimating,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final Paint circelOne = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;

    final Paint circelTwo = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.fill;

    final Paint circelThree = Paint()
      ..color = Colors.grey[500]!
      ..style = PaintingStyle.fill;

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );
    final radiusOne = size.width / 2 - 10;
    final radiusTwo = radiusOne - 20;
    final radiusThree = radiusTwo - 20;

    if (isThirdCircleAnimating) {
      canvas.drawCircle(center, radiusThree, circelThree);
    }
    if (isSecondCircleAnimating) {
      canvas.drawCircle(center, radiusTwo, circelTwo);
    }
    if (isFirstCircleAnimating) {
      canvas.drawCircle(center, radiusOne, circelOne);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
