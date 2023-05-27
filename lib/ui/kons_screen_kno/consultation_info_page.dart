import 'package:flutter/material.dart';

import '../../dummy/current_user.dart';
import '../../entities/consultation.dart';
import '../../services/business_api.dart';
import '../common/kno_theme_card.dart';
import '../common/utils.dart';
import '../common/week_day_date_time_widget.dart';
import '../navigation/route_name.dart';
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
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Вопрос пользователя: ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: consultation.question,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              if (!consultation.isConfirmed!)
                ElevatedButton(
                    onPressed: () async {
                      await BusinessAPI.instance.editConsultationStatus(
                          user.token!, consultation.id!, true);
                    },
                    child: const Text('Подтвердить запись')),
              if (isTimeBegin(consultation.date!, consultation.time!))
                Column(
                  children: [
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              AppNavRouteName.joinKonsKNO,
                              arguments: consultation);
                        },
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
                  : AppColor.access
              : AppColor.warning,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              consultation.isConfirmed!
                  ? isTimeStart
                      ? Icons.crisis_alert
                      : Icons.done
                  : Icons.access_time_outlined,
              color: AppColor.whiteColor),
          const SizedBox(width: 8),
          Text(
              consultation.isConfirmed!
                  ? isTimeStart
                      ? 'Началось время консультации'
                      : 'Запись подтверждена'
                  : 'Запись ожидает подтверждения',
              style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
