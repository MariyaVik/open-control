import 'package:flutter/material.dart';

import '../../../dummy/current_user.dart';
import '../../../services/business_api.dart';
import '../../common/response_widgets.dart';
import '../../navigation/route_name.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.isKno});
  final bool isKno;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    loginController.text = widget.isKno ? 'kno' : 'user';
    passwordController = TextEditingController();
    passwordController.text = '123321';
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: loginController,
            decoration: const InputDecoration(hintText: 'Логин'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Пароль'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
          ),
          const Flexible(child: ResponseVerticalWidget(ratio: 2)),
          Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {}, child: const Text('Восстановить'))),
          const Flexible(child: ResponseVerticalWidget(ratio: 5)),
          ResponseHorizontalWidget(
              ratio: 70,
              child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      user.token = await BusinessAPI.instance.authApiRequest(
                          loginController.text, passwordController.text);
                      var u =
                          await BusinessAPI.instance.getUserInfo(user.token!);
                      user
                        ..name = u.name
                        ..email = u.email
                        ..id = u.id;
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          widget.isKno
                              ? AppNavRouteName.homeKNO
                              : AppNavRouteName.homeBusiness,
                          (route) => false);
                    }
                  },
                  child: const Text('Войти'))),
        ],
      ),
    );
  }
}
