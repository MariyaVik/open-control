import 'package:flutter/material.dart';

import '../common/response_widgets.dart';
import 'widgets/back_button.dart';
import 'widgets/login_form.dart';
import 'widgets/logo_full.dart';

class LoginKHOPage extends StatelessWidget {
  const LoginKHOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: const [BackButtonWidget()]),
                  const ResponseVerticalWidget(ratio: 3),
                  ResponseVerticalWidget(
                      ratio: 4,
                      child: Image.asset('assets/images/text_cloud.png')),
                  const Text('Единая система доступа'),
                  const ResponseVerticalWidget(ratio: 5),
                  const ResponseVerticalWidget(ratio: 7, child: LogoFull()),
                  const ResponseVerticalWidget(ratio: 5),
                  const ResponseHorizontalWidget(ratio: 70, child: LoginForm()),
                ]),
          ),
        ),
      ),
    );
  }
}
