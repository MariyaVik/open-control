import 'package:flutter/material.dart';
import 'package:open_control/dummy/current_kons.dart';
import 'package:open_control/entities/all_consultations.dart';
import 'package:open_control/entities/consultation.dart';
import 'package:open_control/services/business_api.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../../dummy/current_user.dart';
import '../../dummy/kno_info.dart';
import '../../entities/user_info.dart';
import 'widgets/footer.dart';
import 'widgets/head.dart';
import 'widgets/other_for_business.dart';
import 'widgets/other_for_kno.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    UserInfo data = await BusinessAPI.instance.getUserInfo(user.token!);
    user
      ..email = data.email
      ..id = data.id
      ..name = data.name
      ..isKno = data.isKno
      ..knoId = data.knoId;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Личный кабинет'),
        actions: [
          IconButton(
              onPressed: () {
                user = UserInfo();
                currentKons = Consultation();
                allConsultations = AllConsultations();
                knos = [];
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppNavRouteName.login, (route) => false);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: user.id == null
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ProfileHead(user: user),
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: user.isKno == null
                          ? const BusinessOther()
                          : const KnoOther()),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ProfileFooter(),
                  )
                ],
              ),
            ),
    );
  }
}
