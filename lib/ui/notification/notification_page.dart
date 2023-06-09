import 'package:flutter/material.dart';

import 'package:open_control/services/business_api.dart';
import 'package:provider/provider.dart';

import '../../entities/notifications.dart';
import '../../mobX/common/common_state.dart';
import '../app.dart';
import '../common/app_bar_back.dart';
import '../common/circular_icon_button.dart';
import '../navigation/route_name.dart';
import '../theme/app_color.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notifications>? nots;
  Future<void> getNot() async {
    nots = await BusinessAPI.instance.getNotifications(
        Provider.of<CommonState>(context, listen: false).user.token!);
    // nots = nots!.reversed.toList();
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
        appBar: appBarBack(context, title: 'Уведомления'),
        body: nots == null
            ? const Center(child: CircularProgressIndicator())
            : nots!.isEmpty
                ? const Center(
                    child: Text('Уведомлений пока нет'),
                  )
                : ListView.builder(
                    // reverse: true,
                    itemCount: nots!.length,
                    itemBuilder: (contex, index) {
                      return GestureDetector(
                        onTap: () {
                          mainNavigatorKey.currentState!.pushNamed(
                              AppNavRouteName.konsDateilsBusiness,
                              arguments: nots![index].consultationId);
                        },
                        child: Container(
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
                                        '${DateTime.now().difference(nots![index].date).inMinutes} минут назад')
                                  ]),
                              Text(
                                  '${nots![index].text} id ${nots![index].consultationId}'),
                            ],
                          ),
                        ),
                      );
                    }),
      ),
    );
  }
}
