class Consultation {
  int? knoId;
  int? userId;
  int? controlTypeId;
  int? consultTopicId;
  String? time;
  String? date;
  bool? isNeedLetter;
  Consultation({
    this.consultTopicId,
    this.controlTypeId,
    this.date,
    this.isNeedLetter,
    this.knoId,
    this.time,
    this.userId,
  });
}
