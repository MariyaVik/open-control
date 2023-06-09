import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import '../../entities/conference_settings.dart';
import '../../mobX/common/common_state.dart';

class VideoConferencePage extends StatelessWidget {
  final ConferenceSettings settings;

  const VideoConferencePage({
    Key? key,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: settings.appId,
        appSign: settings.appSign,
        userID:
            Provider.of<CommonState>(context, listen: false).user.id.toString(),
        userName: Provider.of<CommonState>(context, listen: false).user.name!,
        conferenceID: settings.conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
            turnOnCameraWhenJoining: settings.turnOnCamera,
            turnOnMicrophoneWhenJoining: settings.turnOnMic),
      ),
    );
  }
}

// const int appId = 903558714;
// const String appSign =
//     '151bb1ac3e601d89aea0ce6a9adcfa8a819ab8bf1ba477fe3bf421597ed1f733';
