import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class UserKons extends StatelessWidget {
  const UserKons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      color: AppColor.greyLight,
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
        )
      ],
    );
  }
}
