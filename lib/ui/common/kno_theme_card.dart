import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class KnoThemeCard extends StatelessWidget {
  final bool isTheme;
  final String name;
  final bool isActive;
  const KnoThemeCard(
      {super.key,
      required this.isTheme,
      required this.name,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: isActive ? AppColor.pinkLight : AppColor.pinkLighter,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isTheme ? 'ТЕМА КОНСУЛЬТИРОВАНИЯ' : 'ОРГАН КОНТРОЛЯ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Text(
                name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColor.textMain),
              )
            ],
          )),
          const SizedBox(width: 12),
          Image.asset(
            isTheme
                ? 'assets/images/for_theme.png'
                : 'assets/images/gerb_white.png',
            color: isActive ? Colors.white : AppColor.greyLight,
          )
        ],
      ),
    );
  }
}
