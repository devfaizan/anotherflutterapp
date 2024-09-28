import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/bubbleanimation.dart';
import 'package:orhan_ui/utils/misc.dart';

class CircleView extends StatefulWidget {
  const CircleView({
    super.key,
  });

  @override
  State<CircleView> createState() => _CircleViewState();
}

class _CircleViewState extends State<CircleView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isAnimatedGradient = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState(() {
              _isAnimatedGradient = _animationController.value < 0.5;
            });
          });
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        colorWhite,
                        Colors.blue[500]!,
                        Colors.purple[300]!,
                      ],
                      begin: _isAnimatedGradient
                          ? Alignment.topLeft
                          : Alignment.bottomLeft,
                      end: _isAnimatedGradient
                          ? Alignment.bottomRight
                          : Alignment.topRight,
                    ),
                  ),
                );
              },
            ),
          ),
          const BubbleAnimation(),
        ],
      ),
    );
  }
}
