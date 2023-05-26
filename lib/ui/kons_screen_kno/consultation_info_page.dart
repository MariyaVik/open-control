import 'package:flutter/material.dart';

import '../../dummy/current_user.dart';
import '../../entities/consultation.dart';
import '../../services/business_api.dart';
import '../common/kno_theme_card.dart';
import '../common/utils.dart';
import '../common/week_day_date_time_widget.dart';
import '../theme/app_color.dart';

class ConsultationInfoPage extends StatelessWidget {
  final Consultation consultation;
  const ConsultationInfoPage({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WarningWidget(consultation: consultation),
              const SizedBox(height: 22),
              WeekDayDateTimeWidget(consultation: consultation),
              const SizedBox(height: 32),
              Text('Пользователь юридическое лицо ООО ″Архивариус″'),
              const SizedBox(height: 16),
              KnoThemeCard(
                isTheme: true,
                name:
                    'Региональный государственный контроль (надзор) за применением цен на лекарственные препараты, включенные в перечень жизненно необходимых и важнейших лекарственных препаратов',
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Checkbox(value: true, onChanged: null),
                  Expanded(
                    child: Text(
                        'Хочу получить письменное разъяснение по результатам консультирования'),
                  )
                ],
              ),
              const SizedBox(height: 16),
              if (!consultation.isConfirmed!)
                ElevatedButton(
                    onPressed: () async {
                      // await BusinessAPI.instance.editConsultationStatus(
                      //     user.token!, consultation.id!, true);
                    },
                    child: const Text('Подтвердить запись')),
              if (isTimeBegin(consultation.date!, consultation.time!))
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColor.greyMedium,
                          borderRadius: BorderRadius.circular(5)),
                      height: 234,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Начать консультацию'))
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class WarningWidget extends StatelessWidget {
  const WarningWidget({
    super.key,
    required this.consultation,
  });

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    final bool isTimeStart =
        isTimeBegin(consultation.date!, consultation.time!);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
      decoration: BoxDecoration(
          color: consultation.isConfirmed!
              ? isTimeStart
                  ? AppColor.mainColor
                  : AppColor.greyLight
              : AppColor.warning,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(consultation.isConfirmed!
              ? isTimeStart
                  ? Icons.crisis_alert
                  : Icons.done
              : Icons.access_time_outlined),
          const SizedBox(width: 8),
          Text(consultation.isConfirmed!
              ? isTimeStart
                  ? 'Началось время консультации'
                  : 'Запись подтверждена'
              : 'Запись ожидает подтверждения'),
        ],
      ),
    );
  }
}
