import 'package:flutter/material.dart';

import '../common/utils.dart';
import 'widgets/drop_down_button.dart';
import '../../../dummy/current_kons.dart';

class SelectThemeView extends StatelessWidget {
  const SelectThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ГЛАВНОЕ АРХИВНОЕ УПРАВЛЕНИЕ ГОРОДА МОСКВЫ'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${getWeekDay(getDateFromString(currentKons.date!).weekday)},'),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                              text: getDateFromString(currentKons.date!)
                                  .day
                                  .toString(),
                              style: TextStyle(fontSize: 24)),
                          TextSpan(
                              text:
                                  ' ${getMonthName(getDateFromString(currentKons.date!).month)}'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Text(currentKons.time!)
              ],
            ),
            Text('Консультирование пройдет по ВКС в приложении'),
            const Text('Тема консультирования'),
            SelectWidget(hint: 'Выберите тему', listItem: ['1', '2']),
            const Text('Вопрос'),
            TextField(maxLines: 4),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: ((value) {}),
                ),
                const Expanded(
                  child: Text(
                      'Хочу получить письменное разъяснение по результатам консультирования'),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Отмена',
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Записаться'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
