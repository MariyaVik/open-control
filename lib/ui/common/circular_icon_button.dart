import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class CircularIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  const CircularIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: AppColor.mainColor, shape: BoxShape.circle),
        child: icon,
      ),
    );
  }
}
