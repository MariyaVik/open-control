import 'package:flutter/material.dart';

import '../../../entities/kno.dart';
import '../../theme/app_color.dart';

class KNOCard extends StatelessWidget {
  final NadzorOrgans kno;
  const KNOCard({super.key, required this.kno});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text(kno.name.toUpperCase()),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      // text: kno.controlTypes.length.toString(),
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                            text: kno.controlTypes.length.toString(),
                            style: TextStyle(color: AppColor.mainColor)),
                        TextSpan(text: ' вид контроля')
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                            text: '38',
                            style: TextStyle(color: AppColor.mainColor)),
                        TextSpan(text: ' обязательных требований')
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                            text: '2',
                            style: TextStyle(color: AppColor.mainColor)),
                        TextSpan(text: ' нормативных акта')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/archive.png')
          ],
        ),
      ]),
    );
  }
}
