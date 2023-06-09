import 'package:flutter/material.dart';
import 'package:open_control/ui/common/app_bar_back.dart';
import 'package:provider/provider.dart';

import '../../entities/consultation.dart';
import '../../mobX/common/common_state.dart';
import '../../services/business_api.dart';
import '../common/kno_theme_card.dart';
import '../common/utils.dart';
import '../common/week_day_date_time_widget.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';
import 'cancel_cons.dart';

class ConsultationInfoPage extends StatelessWidget {
  final Consultation consultation;
  const ConsultationInfoPage({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBack(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WarningWidget(consultation: consultation),
              const SizedBox(height: 22),
              WeekDayDateTimeWidget(consultation: consultation),
              const SizedBox(height: 32),
              Text(
                'Пользователь ${consultation.user!.name} (юридическое лицо ООО ″Архивариус″)',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Подробнее',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500, color: AppColor.mainColor),
                  )),
              const SizedBox(height: 16),
              KnoThemeCard(
                  isTheme: true, name: consultation.consultTopicId.toString()),
              const SizedBox(height: 8),
              if (consultation.isNeedLetter == true)
                Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColor.textLow),
                      child: const ImageIcon(
                        AssetImage('assets/icons/tick.png'),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Checkbox(value: consultation.isNeedLetter, onChanged: (v) {}),
                    Expanded(
                      child: Text(
                          'Хочу получить письменное разъяснение по результатам консультирования',
                          style: Theme.of(context).textTheme.labelSmall),
                    )
                  ],
                ),
              const SizedBox(height: 16),
              RichText(
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Вопрос пользователя: ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: consultation.question,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (!consultation.isConfirmed!)
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await BusinessAPI.instance.editConsultationStatus(
                            Provider.of<CommonState>(context, listen: false)
                                .user
                                .token!,
                            consultation.id!,
                            true);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppNavRouteName.konsMainKNO, (route) => false);
                      },
                      child: const Text('Подтвердить запись')),
                ),
              if (consultation.isConfirmed! &&
                  isTimeBegin(consultation.date!, consultation.time!))
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              AppNavRouteName.joinKonsKNO,
                              arguments: consultation);
                        },
                        child: const Text('Начать консультацию'))),
              Center(
                child: TextButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return CancelConsultation(
                              consultation: consultation,
                            );
                          });
                    },
                    child: Text('Отменить запись')),
              )
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
          Expanded(
            child: Text(
                consultation.isConfirmed!
                    ? isTimeStart
                        ? 'Началось время консультации'
                        : 'Запись подтверждена'
                    : 'Запись ожидает подтверждения',
                style: Theme.of(context).textTheme.labelLarge),
          ),
        ],
      ),
    );
  }
}
