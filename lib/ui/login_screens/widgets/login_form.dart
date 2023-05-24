import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/response_widgets.dart';
import '../../common/size_config.dart';
import '../../navigation/main_navigation.dart';
import '../../navigation/route_name.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

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
    passwordController = TextEditingController();
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
                      // для проверки прямо здесь
                      var dio = Dio();

                      var response = await dio.post(
                          'http://hack.torbeno.ru/api/v1/login',
                          options: Options(
                              contentType: 'application/x-www-form-urlencoded'),
                          data: {'login': 'user', 'password': '123321'});

                      print(response.statusCode);
                      print(response.data.toString());
                      Navigator.of(context).pushNamed(AppNavRouteName.home);
                    }
                  },
                  child: const Text('Войти'))),
        ],
      ),
    );
  }
}
