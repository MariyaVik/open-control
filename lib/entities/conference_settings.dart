class ConferenceSettings {
  String conferenceID;
  final int appId = 903558714;
  final String appSign =
      '151bb1ac3e601d89aea0ce6a9adcfa8a819ab8bf1ba477fe3bf421597ed1f733';
  bool turnOnCamera;
  bool turnOnMic;

  ConferenceSettings(
      {required this.conferenceID,
      this.turnOnCamera = true,
      this.turnOnMic = true});
}
