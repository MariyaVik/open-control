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
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: const [BackButtonWidget()]),
                    const Flexible(child: ResponseVerticalWidget(ratio: 5)),
                    ResponseVerticalWidget(
                        ratio: 4,
                        child: Image.asset('assets/images/text_cloud.png')),
                    const Text('Единая система доступа'),
                    const Flexible(child: ResponseVerticalWidget(ratio: 10)),
                    const ResponseVerticalWidget(ratio: 7, child: LogoFull()),
                    const Flexible(child: ResponseVerticalWidget(ratio: 10)),
                    const ResponseHorizontalWidget(
                        ratio: 70, child: LoginForm()),
                    const Flexible(child: ResponseVerticalWidget(ratio: 10)),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
