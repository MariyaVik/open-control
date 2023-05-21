import 'package:flutter/material.dart';

class LogoFull extends StatelessWidget {
  const LogoFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(width: 16),
        Image.asset('assets/images/Logotype.png'),
      ],
    );
  }
}
