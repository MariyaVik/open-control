import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back, color: AppColor.mainColor));
  }
}
