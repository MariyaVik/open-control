import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../../dummy/current_user.dart';
import '../../entities/consultation.dart';
import '../theme/app_color.dart';

class JoinKonsPage extends StatelessWidget {
  final Consultation consultation;
  const JoinKonsPage({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColor.greyMedium,
                  borderRadius: BorderRadius.circular(5)),
              height: 234,
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        print(user.name);
                        Navigator.of(context).pushNamed(
                            user.isKno == null
                                ? AppNavRouteName.videoBusiness
                                : AppNavRouteName.videoKNO,
                            arguments: consultation.id.toString());
                      },
                      child: Text('Подключиться'))),
            ),
          ],
        ),
      ),
    );
  }
}
