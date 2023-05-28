import 'package:flutter/material.dart';

import '../common/app_bar_logo.dart';
import '../common/response_widgets.dart';
import 'widgets/back_button.dart';
import 'widgets/login_form.dart';

class LoginKHOPage extends StatelessWidget {
  const LoginKHOPage({super.key});

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
                    const Flexible(child: ResponseVerticalWidget(ratio: 5)),
                    Row(
                      children: [
                        ResponseVerticalWidget(
                            ratio: 6,
                            child: Image.asset('assets/images/text_cloud.png')),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Единая система доступа',
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
                    const Flexible(child: ResponseVerticalWidget(ratio: 10)),
                    const ResponseHorizontalWidget(
                        ratio: 70, child: LoginForm(isKno: true)),
                    const Flexible(child: ResponseVerticalWidget(ratio: 10)),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
