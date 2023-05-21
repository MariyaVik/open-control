import 'package:flutter/material.dart';

import '../../common/response_widgets.dart';

class SelectRoleButton extends StatelessWidget {
  const SelectRoleButton(
      {super.key,
      required this.iconName,
      required this.routeName,
      required this.text});
  final String iconName;
  final String routeName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ResponseHorizontalWidget(
        ratio: 70,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(routeName);
            },
            child: Row(
              children: [
                const SizedBox(width: 16),
                Image.asset('assets/icons/$iconName.png',
                    height: 16, width: 16),
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));
  }
}
