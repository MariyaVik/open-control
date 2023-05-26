import 'package:flutter/material.dart';

import '../../../entities/user_info.dart';
import '../../theme/app_color.dart';

class ProfileHead extends StatelessWidget {
  final UserInfo user;
  const ProfileHead({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: AppColor.mainColor, shape: BoxShape.circle),
          child: Image.asset('assets/icons/avatar.png'),
        ),
        const SizedBox(height: 12),
        Text(user.name!),
        Text(user.isKno == null ? 'бизнес-профиль' : 'пользователь КНО'),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: AppColor.pink, shape: BoxShape.circle),
                  child: Image.asset('assets/icons/search.png'),
                ),
                Text('Мои данные')
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: AppColor.pink, shape: BoxShape.circle),
                  child: Image.asset('assets/icons/doc.png'),
                ),
                Text('Мои консультации')
              ],
            )
          ],
        )
      ],
    );
  }
}
