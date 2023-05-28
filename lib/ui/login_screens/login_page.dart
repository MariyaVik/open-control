import 'package:flutter/material.dart';

import '../common/response_widgets.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';
import 'widgets/select_role_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Image.asset(
          'assets/images/Logotype.png',
        )),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              child: ResponseHorizontalWidget(
                ratio: 90,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Вход в личный кабинет',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Для входа в личный кабинет выберите полномочие и авторизуйтесь',
                        style: TextStyle(color: AppColor.textMain),
                      ),
                      const SizedBox(height: 32),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
