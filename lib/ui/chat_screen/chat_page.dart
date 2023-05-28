import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:open_control/ui/navigation/route_name.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../dummy/current_user.dart';
import '../../entities/hint_button.dart';
import '../../entities/message.dart';
import '../../services/business_api.dart';
import '../common/size_config.dart';
import '../common/utils.dart';
import '../theme/app_color.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> _elements = [];
  List<HintButton> buttons = [];
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  Future<void> getMes() async {
    _elements = await BusinessAPI.instance.getMessages(user.token!);
    buttons = await BusinessAPI.instance.getButtons(user.token!);

    setState(() {});
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      controller.text = _lastWords;
    });
  }

  @override
  void initState() {
    super.initState();
    getMes();
    _initSpeech();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Чат-бот'),
          actions: [
            IconButton(
              icon: const ImageIcon(AssetImage('assets/icons/messages.png')),
              onPressed: () {
                Navigator.of(context).pushNamed(AppNavRouteName.faq);
              },
            )
          ],
        ),
        body: Column(
          children: [
            _elements.isEmpty
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: GroupedListView<Message, DateTime>(
                      controller: scrollController,
                      elements: _elements,
                      groupBy: (element) => DateTime(element.date.year,
                          element.date.month, element.date.day),
                      groupHeaderBuilder: (value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${value.date.day} ${getMonthName(value.date.month)}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      itemBuilder: (c, element) {
                        return Align(
                          alignment: element.from == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: element.from == 0
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    minWidth: SizeConfig.screenWidth * 0.66,
                                    maxWidth: SizeConfig.screenWidth * 0.66),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(16),
                                        topRight: const Radius.circular(16),
                                        bottomLeft: element.from == 0
                                            ? Radius.zero
                                            : const Radius.circular(16),
                                        bottomRight: element.from == 0
                                            ? const Radius.circular(16)
                                            : Radius.zero),
                                    color: element.from == 0
                                        ? AppColor.greyMegaLight
                                        : AppColor.greyLight),
                                child: element.from == 0 &&
                                        element.text.contains('Собрал ответы')
                                    ? RichText(
                                        text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Собрал ответы',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColor.mainColor),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.of(context).pushNamed(
                                                    AppNavRouteName.faq);
                                              }),
                                        TextSpan(
                                            text: element.text.replaceAll(
                                                'Собрал ответы', ''),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.of(context).pushNamed(
                                                    AppNavRouteName.faq);
                                              }),
                                      ]))
                                    : Text(element.text),
                              ),
                              Text(
                                  '${element.date.hour}:${element.date.minute}')
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            if (buttons.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 8),
                width: double.infinity,
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                        onPressed: () {}, child: Text(buttons[index].text));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: AppColor.greyLight))),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: 'Ваше сообщение',
                        suffixIcon: IconButton(
                            onPressed: () async {
                              Message newQues = Message(
                                  date: DateTime.now().toUtc(),
                                  from: user.id!,
                                  id: -1,
                                  text: controller.text,
                                  to: 0);
                              _elements.add(newQues);
                              Message ans = await BusinessAPI.instance
                                  .postMessage(user.token!, newQues.text);
                              _elements.add(ans);
                              controller.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {});
                            },
                            icon: Image.asset('assets/icons/send.png'))),
                  )),
                  IconButton(
                    onPressed: _speechToText.isNotListening
                        ? _startListening
                        : _stopListening,
                    // icon: const ImageIcon(AssetImage('assets/icons/mic.png')),
                    icon: Icon(_speechToText.isNotListening
                        ? Icons.mic_off
                        : Icons.mic),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
