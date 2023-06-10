import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:open_control/ui/app.dart';
import 'package:open_control/ui/navigation/route_name.dart';
import 'package:provider/provider.dart';

import '../../entities/conference_settings.dart';
import '../../entities/consultation.dart';
import '../../mobX/common/common_state.dart';
import '../common/app_bar_back.dart';
import '../theme/app_color.dart';

class JoinKonsPage extends StatefulWidget {
  final Consultation consultation;
  const JoinKonsPage({super.key, required this.consultation});

  @override
  State<JoinKonsPage> createState() => _JoinKonsPageState();
}

class _JoinKonsPageState extends State<JoinKonsPage> {
  late ConferenceSettings settings;

  @override
  void initState() {
    super.initState();
    settings =
        ConferenceSettings(conferenceID: widget.consultation.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    log(Provider.of<CommonState>(context, listen: false).user.name!);
    return Scaffold(
      appBar: appBarBack(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                  color: AppColor.greyMedium,
                  borderRadius: BorderRadius.circular(5)),
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            mainNavigatorKey.currentState!.pushNamed(
                                AppNavRouteName.videoCall,
                                arguments: settings);
                          },
                          child: const Text('Подключиться'))),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.greyLight),
                            child: IconButton(
                              onPressed: () {
                                settings.turnOnCamera = !settings.turnOnCamera;
                                setState(() {});
                              },
                              icon: Icon(
                                  settings.turnOnCamera
                                      ? Icons.videocam
                                      : Icons.videocam_off_outlined,
                                  color: Colors.white),
                            ),
                          ),
                          const Text(
                            'Камера',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.greyLight),
                            child: IconButton(
                              onPressed: () {
                                settings.turnOnMic = !settings.turnOnMic;

                                setState(() {});
                              },
                              icon: Icon(
                                  settings.turnOnMic
                                      ? Icons.mic
                                      : Icons.mic_off_outlined,
                                  color: Colors.white),
                            ),
                          ),
                          const Text(
                            'Звук',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(children: [
                    const TextSpan(
                        text:
                            'Если не удаётся войти в конференцию, то воспользуйтесь ссылкой  ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        style: const TextStyle(color: Colors.blue),
                        text: widget.consultation.vksLink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            mainNavigatorKey.currentState!.pushNamed(
                                AppNavRouteName.webView,
                                arguments: widget.consultation.vksLink);
                          }),
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
