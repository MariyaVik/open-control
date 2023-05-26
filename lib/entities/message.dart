import 'hint_button.dart';

class Message {
  final int id;
  final String text;
  final DateTime date;
  final int from;
  final int to;
  final List<HintButton>? hintButtons;

  Message(
      {required this.date,
      required this.from,
      this.hintButtons,
      required this.id,
      required this.text,
      required this.to});
}
