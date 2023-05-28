import 'package:flutter/material.dart';

import 'package:open_control/services/business_api.dart';

import '../../dummy/current_user.dart';
import '../../entities/notifications.dart';
import '../common/circular_icon_button.dart';
import '../theme/app_color.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notifications>? nots;
  Future<void> getNot() async {
    nots = await BusinessAPI.instance.getNotifications(user.token!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNot();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Уведомления'),
          centerTitle: true,
          leading: CircularIconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: nots == null
            ? const Center(child: CircularProgressIndicator())
            : nots!.isEmpty
                ? const Center(
                    child: Text('Уведомлений пока нет'),
                  )
                : ListView.builder(
                    itemCount: nots!.length,
                    itemBuilder: (contex, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        padding: const EdgeInsets.only(
                            top: 12, right: 16, left: 16, bottom: 24),
                        decoration: BoxDecoration(
                            color: AppColor.greyLight,
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      '${DateTime.now().difference(nots![index].date).inDays} дней назад')
                                ]),
                            Text(nots![index].text),
                          ],
                        ),
                      );
                    }),
      ),
    );
  }
}
