import 'package:flutter/material.dart';

class ButtonSample extends StatelessWidget {
  const ButtonSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            print('Clicked on TextButton');
          },
          child: const Text('TextButton'),
        )
      ],
    );
  }
}
