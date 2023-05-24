import 'package:flutter/material.dart';

import '../../entities/kno.dart';
import '../common/close_button.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';
import 'widgets/drop_down_button.dart';

class KNODetails extends StatelessWidget {
  final NadzorOrgans kno;
  const KNODetails({Key? key, required this.kno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.greyLight,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CloseButtonMy(),
              ),
              Text(kno.name.toUpperCase()),
              Text(
                'Главное архивное управление города Москвы (Главархив) реализует государственную политику в сфере архивного дела, а также охраны и использования историко-документального наследия.',
              ),
              Text('Вид контроля'),
              SelectWidget(
                hint: 'Выберите вид контроля',
                listItem: ['sdfv', 'wew', '345', 'sdfv', 'wew', '345'],
              ),
              TextButton(
                  onPressed: () {}, child: Text('Посмотреть требования')),
              TextButton(
                  onPressed: () {},
                  child: Text('Посмотреть нормативные акты ')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        AppNavRouteName.selectDateTime,
                        arguments: kno.id);
                  },
                  child: Text('Перейти к выбору даты'))
            ],
          ),
        ),
      ),
    );
  }
}
