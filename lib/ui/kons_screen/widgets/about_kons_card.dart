import 'package:flutter/material.dart';

import '../../../entities/consultation.dart';
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
              : AppColor.mainColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                consultation.isConfirmed == true
                    ? 'Вы записаны'
                    : 'Ожидает подтверждения от КНО',
                style: TextStyle(color: Colors.white),
              ),
              if (consultation.isConfirmed == true)
                Text('${consultation.date} в ${consultation.time}')
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Text('Изменить', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
