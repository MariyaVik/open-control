import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

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

  Future<void> getMes() async {
    _elements = await BusinessAPI.instance.getMessages(user.token!);
    buttons = await BusinessAPI.instance.getButtons(user.token!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMes();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final List<Message> _elements = [
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 150)),
    //       from: 0,
    //       id: 1,
    //       text: 'первое',
    //       to: 1),
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 148)),
    //       from: 0,
    //       id: 1,
    //       text: 'второе',
    //       to: 1),
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 102)),
    //       from: 1,
    //       id: 1,
    //       text: 'вопрос',
    //       to: 0),
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 101)),
    //       from: 0,
    //       id: 1,
    //       text: 'ответ',
    //       to: 1),
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 100)),
    //       from: 0,
    //       id: 1,
    //       text: 'и ещё ответ',
    //       to: 1),
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 56)),
    //       from: 1,
    //       id: 1,
    //       text: 'доп вопрос',
    //       to: 0),
    //   Message(
    //       date: DateTime.now().subtract(Duration(hours: 56)),
    //       from: 1,
    //       id: 1,
    //       text: 'уточнениееееееееееееееееееееееееееееееееееееееееееееееееее',
    //       to: 0),
    //   Message(
    //     date: DateTime.now().subtract(Duration(hours: 55)),
    //     from: 0,
    //     id: 1,
    //     text: 'супер ответ',
    //     to: 1,
    //   ),
    // ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Чат-бот'),
          actions: [
            IconButton(
              icon: ImageIcon(AssetImage('assets/icons/messages.png')),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            _elements.isEmpty
                ? CircularProgressIndicator()
                : Expanded(
                    child: GroupedListView<Message, DateTime>(
                      elements: _elements,
                      groupBy: (element) => DateTime(element.date.year,
                          element.date.month, element.date.day),
                      // groupComparator: (value1, value2) => value2.compareTo(value1),
                      // itemComparator: (item1, item2) =>
                      //     item1['name'].compareTo(item2['name']),
                      // order: GroupedListOrder.DESC,
                      // useStickyGroupSeparators: true,
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                        bottomLeft: element.from == 0
                                            ? Radius.zero
                                            : Radius.circular(16),
                                        bottomRight: element.from == 0
                                            ? Radius.circular(16)
                                            : Radius.zero),
                                    color: element.from == 0
                                        ? AppColor.greyMegaLight
                                        : AppColor.greyLight),
                                child: Text(element.text),
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
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 8),
                width: double.infinity,
                height: 32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                        onPressed: () {}, child: Text(buttons[index].text));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 8);
                  },
                ),
              ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColor.greyLight))),
              padding: EdgeInsets.all(16),
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
                                  date: DateTime.now(),
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
                      onPressed: () {},
                      icon: ImageIcon(AssetImage('assets/icons/mic.png')))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
