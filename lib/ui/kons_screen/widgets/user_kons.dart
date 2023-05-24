import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class UserKons extends StatelessWidget {
  const UserKons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Image.asset('assets/images/bot.png'),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColor.greyMegaLight,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: const Text(
                      'Задайте свой вопрос в чате, или проконсультируйтесь со специалистом.'),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: AppColor.greyMedium,
              borderRadius: BorderRadius.circular(5)),
          height: 234,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Text('Нет ожидаемой консультации'),
        )
      ],
    );
  }
}
