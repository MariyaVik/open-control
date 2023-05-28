import 'package:flutter/material.dart';
import 'package:open_control/entities/consultation.dart';

import '../../dummy/current_user.dart';
import '../../services/business_api.dart';
import '../theme/app_color.dart';

class CancelConsultation extends StatefulWidget {
  final Consultation consultation;
  const CancelConsultation({super.key, required this.consultation});

  @override
  State<CancelConsultation> createState() => _CancelConsultationState();
}

class _CancelConsultationState extends State<CancelConsultation> {
  final TextEditingController answerController = TextEditingController();

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: AppColor.whiteColor,
      content: Container(
        height: 300,
        decoration: const BoxDecoration(),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextField(
            controller: answerController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Ответ'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: addPurchase, child: const Text('Отправить')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Отмена')),
            ],
          )
        ]),
      ),
    );
  }

  void addPurchase() async {
    await BusinessAPI.instance.editConsultationStatus(
        user.token!, widget.consultation.id!, false, answerController.text);
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
