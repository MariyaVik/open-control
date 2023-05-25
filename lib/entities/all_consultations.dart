import 'consultation.dart';

class AllConsultations {
  List<Consultation> activeKons;
  List<Consultation> finishedKons;
  AllConsultations({this.activeKons = const [], this.finishedKons = const []});
}
