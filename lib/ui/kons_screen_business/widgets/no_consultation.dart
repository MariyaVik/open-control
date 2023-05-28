import 'package:flutter/material.dart';

import '../../navigation/route_name.dart';

class NoConsultation extends StatelessWidget {
  const NoConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bust.png'),
          const SizedBox(height: 20),
          Text(
            'Консультаций пока нет',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Text(
            'Задайте свой вопрос в чате или запишитесь на консультацию с контрольными органами',
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                // Provider.of<CommonState>(context, listen: false).updateTab(0);
                Navigator.of(context)
                    .pushNamed(AppNavRouteName.listKnoBusiness);
              },
              child: const Text('Запись на консультацию'))
        ],
      ),
    ));
  }
}
