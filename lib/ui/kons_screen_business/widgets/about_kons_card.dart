import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../../../dummy/current_user.dart';
import '../../../entities/consultation.dart';
import '../../../services/business_api.dart';
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
          border: Border.all(color: AppColor.greyLight),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
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
          ElevatedButton(
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
                children: [Text('Редактировать (удалить)')],
              )),
          const SizedBox(height: 8),
          Text('Консультирование пройдет по ВКС в этом окне',
              style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          KnoThemeCard(isTheme: false, name: consultation.knoId.toString()),
          const SizedBox(height: 16),
          KnoThemeCard(
              isTheme: true, name: consultation.consultTopicId.toString()),
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
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Ваш вопрос: ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextSpan(
                  text: consultation.question,
                  style: Theme.of(context).textTheme.labelSmall,
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






// Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//                 color: AppColor.greyMedium,
//                 borderRadius: BorderRadius.circular(5)),
//             height: 234,
//           ),