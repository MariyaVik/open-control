import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:open_control/entities/app_tab.dart';
import 'package:open_control/ui/common/circular_icon_button.dart';
import 'package:provider/provider.dart';

import '../../mobX/common/common_state.dart';
import '../theme/app_color.dart';

class FeedbackBot extends StatefulWidget {
  const FeedbackBot({super.key});

  @override
  State<FeedbackBot> createState() => _FeedbackBotState();
}

class _FeedbackBotState extends State<FeedbackBot> {
  bool isNeedCons = false;
  bool isGood = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyMegaLight),
                  borderRadius: BorderRadius.circular(6)),
              child: const Text(
                'Бот смог ответить на ваш вопрос?',
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isNeedCons)
                  CircularIconButton(
                    icon: Image.asset('assets/icons/good.png'),
                    onPressed: () {
                      isGood = true;
                      setState(() {});
                      // Provider.of<CommonState>(context, listen: false)
                      //     .activeTabIndex = 0;
                      // mainNavigatorKey.currentState!.pushNamedAndRemoveUntil(
                      //     AppNavRouteName.homeBusiness, (route) => false);
                    },
                  ),
                const SizedBox(width: 16),
                if (!isGood)
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
          ),
          if (isGood)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyMegaLight),
                  borderRadius: BorderRadius.circular(6)),
              child: const Center(child: Text('Спасибо за обращение!')),
            ),
          if (isNeedCons)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                            Provider.of<CommonState>(context, listen: false)
                                .updateTab(AppTabBussiness.consultation.index);
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
