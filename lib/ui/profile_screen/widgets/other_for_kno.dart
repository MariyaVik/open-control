import 'package:flutter/material.dart';

class KnoOther extends StatelessWidget {
  const KnoOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Цифровые профили'),
        SizedBox(height: 12),
        Text('Контент для портала'),
        SizedBox(height: 12),
        Text('Вопросы от бизнеса'),
        SizedBox(height: 12),
        Text('Запросы бизнесу'),
        SizedBox(height: 12),
        Text('Отчеты'),
        SizedBox(height: 12),
        Text('Удалить учетную запись'),
      ],
    );
  }
}
