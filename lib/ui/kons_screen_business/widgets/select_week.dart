import 'package:flutter/material.dart';

class SelectWeek extends StatelessWidget {
  const SelectWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_sharp)),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_sharp)),
      ],
    );
  }
}
