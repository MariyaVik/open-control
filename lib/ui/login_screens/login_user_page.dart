import 'package:flutter/material.dart';

import '../common/app_bar_logo.dart';
import '../common/response_widgets.dart';
import '../theme/app_color.dart';
import 'widgets/back_button.dart';
import 'widgets/login_form.dart';
import '../common/logo_full.dart';

class LoginUserPage extends StatelessWidget {
  const LoginUserPage({super.key});

  IconButton loginServiceIconButton({required String iconName}) {
    return IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/$iconName.png'),
        padding: EdgeInsets.zero);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarLogo(context),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: const [BackButtonWidget()]),
                    const Flexible(child: ResponseVerticalWidget(ratio: 3)),
                    Row(
                      children: [
                        ResponseVerticalWidget(
                            ratio: 6,
                            child: Image.asset('assets/images/text_cloud.png')),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Доступ к информационным ресурсам города Москвы',
                          ),
                        ),
                      ],
                    ),
                    const Flexible(child: ResponseVerticalWidget(ratio: 3)),
                    const Text(
                      'Вход в Цифровая платформа Открытый контроль',
                      style: TextStyle(fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                    const Flexible(child: ResponseVerticalWidget(ratio: 3)),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Зарегистрироваться')),
                    const Flexible(child: ResponseVerticalWidget(ratio: 2)),
                    const ResponseHorizontalWidget(
                        ratio: 80, child: LoginForm(isKno: false)),
                    const Flexible(child: ResponseVerticalWidget(ratio: 1)),
                    ResponseHorizontalWidget(
                      ratio: 80,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Divider(color: AppColor.greyLight),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('или'),
                                ),
                                Expanded(
                                  child: Divider(color: AppColor.greyLight),
                                ),
                              ],
                            ),
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Войти через')),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                loginServiceIconButton(iconName: 'tinkoff'),
                                loginServiceIconButton(iconName: 'sber'),
                                loginServiceIconButton(iconName: 'gosuslugi'),
                                loginServiceIconButton(iconName: 'vk'),
                                loginServiceIconButton(iconName: 'yandex'),
                                GestureDetector(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: AppColor.greyLight,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(children: [
                                          for (int i = 0; i < 3; i++)
                                            Container(
                                              margin: const EdgeInsets.all(1),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              padding: const EdgeInsets.all(2),
                                            ),
                                        ]))),
                              ],
                            ),
                          ),
                          ResponseHorizontalWidget(
                              ratio: 80,
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Электронная подпись'))),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
