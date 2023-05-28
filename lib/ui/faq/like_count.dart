import 'package:flutter/material.dart';

import '../../entities/faq.dart';
import '../theme/app_color.dart';

class LikeCount extends StatelessWidget {
  const LikeCount({
    super.key,
    required this.faq,
  });

  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(faq.likes.toString()),
        const SizedBox(width: 5),
        const Icon(
          Icons.thumb_up_off_alt_rounded,
          size: 20,
          color: AppColor.textMain,
        )
      ],
    );
  }
}
