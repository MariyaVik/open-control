import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import 'circular_icon_button.dart';

AppBar appBarBack(BuildContext context,
        {String title = '', List<Widget> actions = const []}) =>
    AppBar(
      // elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircularIconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          if (title != '')
            Expanded(
                child: Text(
              title,
              textAlign: TextAlign.center,
            )),
          if (title != '' && actions.isEmpty)
            const SizedBox(width: 32) // костыль
        ],
      ),
      actions: actions,
    );
