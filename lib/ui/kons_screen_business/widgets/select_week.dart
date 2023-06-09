import 'package:flutter/material.dart';

class SelectWeek extends StatelessWidget {
  const SelectWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_sharp)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_sharp)),
        Text('12 июня - 18 июня',
            style: Theme.of(context).textTheme.headlineLarge),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
        // DatePickerDialog(
        //     initialDate: DateTime.now(),
        //     firstDate: DateTime.now(),
        //     lastDate: DateTime.parse('2023-08-31'))
      ],
    );
  }
}
