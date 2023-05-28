import 'package:flutter/material.dart';

import '../../common/circular_icon_button.dart';
import '../../theme/app_color.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularIconButton(
      icon: const Icon(Icons.arrow_back, color: AppColor.whiteColor),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
