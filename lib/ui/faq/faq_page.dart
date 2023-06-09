import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entities/faq.dart';
import '../../mobX/common/common_state.dart';
import '../../services/business_api.dart';
import '../common/app_bar_back.dart';
import '../theme/app_color.dart';
import 'faq_card.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Faq>? faqs;
  final controller = TextEditingController();

  Future<void> getFaq() async {
    faqs = await BusinessAPI.instance
        .getFaq(Provider.of<CommonState>(context, listen: false).user.token!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarBack(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColor.pinkLighter,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Вопросы и ответы',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Интересные и актуальные вопросы от представителей бизнеса и ответы органов контроля',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: 'Поиск по ключевым словам',
                        prefix: IconButton(
                            onPressed: () async {
                              setState(() {
                                faqs = null;
                              });
                              faqs = await BusinessAPI.instance.postFaq(
                                  Provider.of<CommonState>(context,
                                          listen: false)
                                      .user
                                      .token!,
                                  controller.text);
                              setState(() {});
                            },
                            icon: Icon(Icons.search))),
                  ),
                ],
              ),
            ),
            faqs == null
                ? const Center(child: CircularProgressIndicator())
                : faqs!.isEmpty
                    ? Center(child: Text('Ничего не найдено'))
                    : Expanded(
                        child: ListView.builder(
                            itemCount: faqs!.length,
                            itemBuilder: (contex, index) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.greyLight),
                                    borderRadius: BorderRadius.circular(6)),
                                child: FaqContent(faq: faqs![index]),
                              );
                            }))
          ],
        ),
      ),
    );
  }
}
