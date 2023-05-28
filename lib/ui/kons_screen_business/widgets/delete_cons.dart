import 'package:flutter/material.dart';
import 'package:open_control/entities/consultation.dart';
import 'package:open_control/ui/navigation/route_name.dart';

import '../../../dummy/current_user.dart';
import '../../../services/business_api.dart';
import '../../theme/app_color.dart';

class DeleteConsultation extends StatefulWidget {
  final Consultation consultation;
  const DeleteConsultation({super.key, required this.consultation});

  @override
  State<DeleteConsultation> createState() => _DeleteConsultationState();
}

class _DeleteConsultationState extends State<DeleteConsultation> {
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
          Text("Подтверждение"),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColor.warning, shape: BoxShape.circle),
                child: Icon(
                  Icons.question_mark,
                  color: AppColor.whiteColor,
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Text(
                    "Вы уверены, что хотите отменить запись на консультацию?"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Нет')),
              ElevatedButton(onPressed: addPurchase, child: const Text('Да')),
            ],
          )
        ]),
      ),
    );
  }

  void addPurchase() async {
    await BusinessAPI.instance
        .deleteConsultation(user.token!, widget.consultation.id!);
    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AppNavRouteName.homeBusiness, (route) => false);
    }
  }
}
