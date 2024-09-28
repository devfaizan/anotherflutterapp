import 'package:flutter/material.dart';
import 'package:orhan_ui/utils/misc.dart';

class CardViewShadow extends StatelessWidget {
  const CardViewShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          const BoxShadow(
            color: colorBlueDark,
            offset: Offset(0, 12),
          ),
          BoxShadow(
            color: colorBlueLight.withOpacity(0.85),
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
