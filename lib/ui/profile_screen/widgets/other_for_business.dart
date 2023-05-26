import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class BusinessOther extends StatelessWidget {
  const BusinessOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/portfel.png'),
            const SizedBox(width: 8),
            const Text('Цифровой профиль')
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Image.asset('assets/icons/globus.png'),
            const SizedBox(width: 8),
            const Text('Служба поддержки')
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Image.asset('assets/icons/pen.png'),
            const SizedBox(width: 8),
            const Text('Записаться на прием ')
          ],
        ),
        const SizedBox(height: 12),
        const Text('Проверки'),
        const SizedBox(height: 12),
        const Text('Удалить учетную запись'),
        const SizedBox(height: 12),
        const Text('«Горячая линия» Единой справочной службы Москвы'),
        const SizedBox(height: 8),
        const Text(
          '+7 (495) 777-77-77',
          style: TextStyle(color: AppColor.mainColor),
        ),
      ],
    );
  }
}
