import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:open_control/ui/common/circular_icon_button.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../kons_screen_business/kons_page.dart';
import '../theme/app_color.dart';

class FeedbackBot extends StatefulWidget {
  const FeedbackBot({super.key});

  @override
  State<FeedbackBot> createState() => _FeedbackBotState();
}

class _FeedbackBotState extends State<FeedbackBot> {
  bool isNeedCons = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyMegaLight),
                  borderRadius: BorderRadius.circular(6)),
              child: const Text(
                'Бот смог ответить на ваш вопрос?',
                textAlign: TextAlign.center,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isNeedCons)
                CircularIconButton(
                  icon: Image.asset('assets/icons/good.png'),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppNavRouteName.homeBusiness, (route) => false);
                  },
                ),
              SizedBox(width: 16),
              CircularIconButton(
                icon: Image.asset('assets/icons/bad.png'),
                color: AppColor.greyMedium,
                onPressed: () {
                  isNeedCons = true;
                  setState(() {});
                },
              )
            ],
          ),
          if (isNeedCons)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyMegaLight),
                  borderRadius: BorderRadius.circular(6)),
              child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Попробуйте задать вопрос иначе, или',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                        text: ' запишитесь ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.mainColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          }),
                    TextSpan(
                      text: 'на консультацию',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ])),
            ),
        ],
      ),
    );
  }
}
