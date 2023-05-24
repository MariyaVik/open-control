import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class CloseButtonMy extends StatelessWidget {
  const CloseButtonMy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
            color: AppColor.mainColor, shape: BoxShape.circle),
        child: const Icon(
          Icons.close,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
