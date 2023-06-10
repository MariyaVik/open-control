import 'package:flutter/material.dart';
import 'package:open_control/ui/common/app_bar_back.dart';
import 'package:provider/provider.dart';

import '../../entities/consultation.dart';
import '../../mobX/common/common_state.dart';
import 'widgets/about_kons_card.dart';

class KonsDetailsPage extends StatefulWidget {
  final int konsId;
  const KonsDetailsPage({super.key, required this.konsId});

  @override
  State<KonsDetailsPage> createState() => _KonsDetailsPageState();
}

class _KonsDetailsPageState extends State<KonsDetailsPage> {
  Consultation? consultation;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Provider.of<CommonState>(context, listen: false).getAllCons();
    consultation = Provider.of<CommonState>(context, listen: false)
        .allConsultations
        .activeKons
        .where((element) => element.id == widget.konsId)
        .first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarBack(context),
      body: consultation == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: AboutKonsCard(
                consultation: consultation!,
              ),
            ),
    ));
  }
}
