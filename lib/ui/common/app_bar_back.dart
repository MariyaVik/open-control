import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import 'circular_icon_button.dart';

AppBar appBarBack(BuildContext context) => AppBar(
      // elevation: 1,
      automaticallyImplyLeading: false,
      title: CircularIconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColor.whiteColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
