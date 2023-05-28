import 'package:flutter/material.dart';

import '../../common/circular_icon_button.dart';
import '../../theme/app_color.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.pinkLighter,
            border: Border.all(color: AppColor.greyLight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularIconButton(
                icon: Image.asset(
              'assets/icons/$iconName.png',
            )),
            const SizedBox(height: 28),
            Text(text)
          ],
        ),
      ),
    );
  }
}
// ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed(routeName);
//           },
//           child: Row(
//             children: [
//               const SizedBox(width: 16),
//               Image.asset('assets/icons/$iconName.png', height: 16, width: 16),
//               Expanded(
//                 child: Text(
//                   text,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           )),