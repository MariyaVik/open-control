import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/size_config.dart';
import '../../navigation/main_navigation.dart';

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
        children: [
          TextFormField(
            controller: loginController,
            decoration: const InputDecoration(hintText: 'Логин'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите логин';
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
                return 'Введите пароль';
              }
              return null;
            },
          ),
          const SizedBox(height: 4),
          Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {}, child: const Text('Восстановить'))),
          const SizedBox(height: 12),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal * 70,
              child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // для проверки прямо здесь
                      // var dio = Dio();

                      // var response = await dio.post(
                      //     'http://hack.torbeno.ru/api/v1/login',
                      //     data: {'login': 'user', 'password': '123321'});

                      // print(response.statusCode);
                      // print(response.data.toString());
                      Navigator.of(context).pushNamed(AppNavRouteName.home);
                    }
                  },
                  child: const Text('Войти'))),
        ],
      ),
    );
  }
}
