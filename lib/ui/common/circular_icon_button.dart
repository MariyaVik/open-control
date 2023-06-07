import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class CircularIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  final Color color;
  const CircularIconButton(
      {super.key,
      required this.icon,
      this.onPressed,
      this.color = AppColor.mainColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: icon,
      ),
    );
  }
}
