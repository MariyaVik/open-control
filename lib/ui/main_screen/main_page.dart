import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/Logotype.png'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                'Информация',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            ServiceCard(
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
            ServiceCard(
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                'Сервисы',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    color: AppColor.pinkDark,
                    child: Row(
                      children: [
                        Image.asset('assets/images/window.png'),
                        const Expanded(
                            child: Text(
                          'Все сервисы',
                          style: TextStyle(color: AppColor.whiteColor),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ServiceCard(
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
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ServiceCard(
                    color: AppColor.mainColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ходатайство об отсрочке исполнения решения',
                            style: TextStyle(color: AppColor.whiteColor)),
                        Text('+ Направить ходатайство',
                            style: TextStyle(
                                color: AppColor.whiteColor.withOpacity(0.8))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ServiceCard(
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
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Color color;
  final Widget child;
  const ServiceCard({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
