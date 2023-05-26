import 'package:flutter/material.dart';

import '../../../dummy/current_user.dart';
import '../../../entities/consultation.dart';
import '../../../services/business_api.dart';
import '../../theme/app_color.dart';

class AboutKonsCard extends StatelessWidget {
  final Consultation consultation;
  const AboutKonsCard({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: consultation.isConfirmed == true
              ? AppColor.greyDark
              : AppColor.warning),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  consultation.isConfirmed == true
                      ? 'Вы записаны'
                      : 'Ожидает подтверждения id ${consultation.id} вопрос ${consultation.question} КНО ID ${consultation.knoId}',
                  style: TextStyle(color: Colors.white),
                ),
                if (consultation.isConfirmed == true)
                  Text('${consultation.date} в ${consultation.time}')
              ],
            ),
          ),
          TextButton(
              onPressed: () async {
                await BusinessAPI.instance
                    .deleteConsultation(businessUser.token!, consultation.id!);
                print('тут обновляем страницу');
              },
              child: Text('Удалить', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
