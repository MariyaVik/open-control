import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../common/app_bar_logo.dart';
import '../theme/app_color.dart';
import 'service_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context, actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppNavRouteName.notification);
            },
            icon: const Icon(Icons.notifications))
      ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Информация',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              ServiceCard(
                onTap: () {
                  Navigator.of(context).pushNamed(AppNavRouteName.faq);
                },
                color: AppColor.greyMegaLight,
                child: Row(
                  children: const [
                    Expanded(child: Text('Часто задаваемые вопросы')),
                    Icon(
                      Icons.library_books_outlined,
                      color: AppColor.mainColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ServiceCard(
                onTap: () {
                  Navigator.of(context).pushNamed(AppNavRouteName.webView,
                      arguments: 'https://knd.mos.ru/requirements/public');
                },
                color: AppColor.mainColor,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Списки требований КНО Москвы',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColor.whiteColor),
                    )),
                    const Icon(Icons.assignment_late_outlined,
                        color: AppColor.whiteColor)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Сервисы',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: ServiceCard(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppNavRouteName.webView,
                            arguments: 'https://www.mos.ru/oati/services/');
                      },
                      color: AppColor.pinkDark,
                      child: Row(
                        children: [
                          Image.asset('assets/images/window.png', scale: 1.1),
                          const SizedBox(width: 4),
                          const Expanded(
                              child: Text(
                            'Все сервисы',
                            style: TextStyle(color: AppColor.whiteColor),
                          )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 17,
                    child: ServiceCard(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppNavRouteName.webView,
                            arguments: 'https://quiz.knd.mos.ru/');
                      },
                      color: AppColor.greyMegaLight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Вероятность нарушения'),
                          Text(
                            '+ Пройти опрос',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 18,
                    child: ServiceCard(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppNavRouteName.webView,
                            arguments:
                                'https://knd.mos.ru/cabinet/pretrial-complaints-248fz/motions-for-postponements-page');
                      },
                      color: AppColor.mainColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              'Ходатайство об отсрочке исполнения решения',
                              style: TextStyle(color: AppColor.whiteColor)),
                          Text('+ Направить ходатайство',
                              style: TextStyle(
                                  color: AppColor.whiteColor.withOpacity(0.8))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 10,
                    child: ServiceCard(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppNavRouteName.webView,
                            arguments:
                                'https://knd.mos.ru/cabinet/pretrial-complaints-248fz/create');
                      },
                      color: AppColor.pinkDark,
                      child: Column(
                        children: [
                          Image.asset('assets/icons/attention.png'),
                          const Text('Жалобы'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
