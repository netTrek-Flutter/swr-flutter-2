import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: buildText(),
    ),
  );
}

Text buildText() {
  return const Text(
    'hello world 2',
    textDirection: TextDirection.ltr,
  );
}
