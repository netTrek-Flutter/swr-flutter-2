import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Column(
        children: [
          buildText('hello world 1'),
          buildText('hello world 2'),
        ],
      ),
    ),
  );
}

Text buildText(String text) {
  return Text(
    text,
    textDirection: TextDirection.ltr,
  );
}
