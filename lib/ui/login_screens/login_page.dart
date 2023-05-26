import 'package:flutter/material.dart';

import '../common/response_widgets.dart';
import '../navigation/main_navigation.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';
import 'widgets/logo_full.dart';
import 'widgets/select_role_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Column(
          children: [
            const Spacer(flex: 8),
            const ResponseVerticalWidget(ratio: 7, child: LogoFull()),
            const Spacer(flex: 6),
            const SelectRoleButton(
              iconName: 'shield',
              routeName: AppNavRouteName.loginKHO,
              text: 'Войти как орган контроля',
            ),
            const SizedBox(height: 12),
            const SelectRoleButton(
              iconName: 'forBus',
              routeName: AppNavRouteName.loginBusiness,
              text: 'Войти как бизнес',
            ),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () {},
                child: const Text('Войти под другим полномочием')),
            const Spacer(flex: 4),
            TextButton(
                onPressed: () {},
                style: Theme.of(context).textButtonTheme.style!.copyWith(
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        Theme.of(context).textTheme.bodySmall!),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColor.greyDark)),
                child: const Text('Инструкция для входа в личный кабинет')),
          ],
        ),
      ),
    );
  }
}
