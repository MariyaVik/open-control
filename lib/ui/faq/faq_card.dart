import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../entities/faq.dart';
import '../app.dart';
import '../navigation/route_name.dart';
import 'like_count.dart';

class FaqContent extends StatelessWidget {
  const FaqContent({
    super.key,
    required this.faq,
  });

  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        mainNavigatorKey.currentState!.pushNamed(AppNavRouteName.faqDetails,
            arguments: faq); // ПЕРЕХОД ИСПРАВИТЬ !!!
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(faq.question),
          const SizedBox(height: 12),
          Text('Отвечает', style: Theme.of(context).textTheme.labelSmall),
          Text('Орган с id ${faq.nadzorOrganId}'.toUpperCase()),
          const SizedBox(height: 20),
          Row(
            children: [
              LikeCount(faq: faq),
              const SizedBox(width: 20),
              Text(DateFormat('dd.MM.yyyy').format(faq.date),
                  style: Theme.of(context).textTheme.labelSmall)
            ],
          )
        ],
      ),
    );
  }
}
