import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import '../../dummy/current_user.dart';

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: appId,
        appSign: appSign,
        userID: user.id.toString(),
        userName: user.name!,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}

const int appId = 903558714;
const String appSign =
    '151bb1ac3e601d89aea0ce6a9adcfa8a819ab8bf1ba477fe3bf421597ed1f733';
