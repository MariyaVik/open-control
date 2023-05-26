import 'package:flutter/material.dart';

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/images/gerb_moscow.png'),
            const Expanded(child: Text('При поддержке Правительства Москвы'))
          ],
        ),
        const SizedBox(height: 12),
        const Text('© 2020 ИС «Цифровая платформа КНО»'),
        const SizedBox(height: 4),
        const Text(
            'Соглашение о пользовании информационными системами и ресурсами города Москвы'),
      ],
    );
  }
}
