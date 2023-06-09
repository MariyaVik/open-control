import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../../../entities/consultation.dart';
import '../../common/kno_theme_card.dart';
import '../../common/utils.dart';
import '../../common/week_day_date_time_widget.dart';
import '../../theme/app_color.dart';
import 'delete_cons.dart';

class AboutKonsCard extends StatelessWidget {
  final Consultation consultation;
  const AboutKonsCard({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    final bool isTimeStart =
        isTimeBegin(consultation.date!, consultation.time!);
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
              color: consultation.isConfirmed == true
                  ? isTimeStart
                      ? AppColor.mainColor
                      : AppColor.access
                  : AppColor.warning),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: consultation.isConfirmed == true
                    ? isTimeStart
                        ? AppColor.mainColor
                        : AppColor.access
                    : AppColor.warning),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    consultation.isConfirmed == true
                        ? isTimeStart
                            ? 'Консультация скоро начнётся'
                            : 'Вы записаны на консультацию'
                        : 'Ваша консультация ожидает подтверждения от КНО',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
          WeekDayDateTimeWidget(consultation: consultation),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.greyLight),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteConsultation(
                          consultation: consultation,
                        );
                      });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Text('Редактировать (удалить)')],
                )),
          ),
          const SizedBox(height: 8),
          Text('Консультирование пройдет по ВКС в этом окне',
              style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          KnoThemeCard(isTheme: false, name: consultation.kno!.name),
          const SizedBox(height: 16),
          KnoThemeCard(isTheme: true, name: consultation.consultTopic!.name),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(value: consultation.isNeedLetter, onChanged: null),
              Expanded(
                child: Text(
                    'Хочу получить письменное разъяснение по результатам консультирования',
                    style: Theme.of(context).textTheme.labelSmall),
              )
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Ваш вопрос: ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextSpan(
                  text: consultation.question,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          if (isTimeBegin(consultation.date!, consultation.time!))
            Column(
              children: [
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          AppNavRouteName.joinKonsBusiness,
                          arguments: consultation);
                    },
                    child: const Text('Перейти к конференции'))
              ],
            ),
        ],
      ),
    );
  }
}

class AboutFinishedKonsCard extends StatelessWidget {
  final Consultation consultation;
  const AboutFinishedKonsCard({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyLight),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeekDayDateTimeWidget(consultation: consultation),
          const SizedBox(height: 16),
          const SizedBox(height: 8),
          Text('Консультирование по ВКС в приложении',
              style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          KnoThemeCard(
              isTheme: false, name: consultation.kno!.name, isActive: false),
          const SizedBox(height: 16),
          KnoThemeCard(
              isTheme: true,
              name: consultation.consultTopic!.name,
              isActive: false),
          const SizedBox(height: 8),
          TextButton(
              onPressed: () {},
              child: Text('Видеозапись ${consultation.date}')),
          Row(
            children: [
              Checkbox(value: consultation.isNeedLetter, onChanged: null),
              Expanded(
                child: Text(
                    'Хочу получить письменное разъяснение по результатам консультирования',
                    style: Theme.of(context).textTheme.labelSmall),
              )
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Ваш вопрос: ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextSpan(
                  text: consultation.question,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Ответ КНО: ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextSpan(
                  text: consultation.answer,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
