import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: buildText('app title'),
      ),
      body: Center(
        child: buildText(),
      ),
    ),
  ));
}

Text buildText([String text = 'hello world']) {
  return Text(
    text,
    // textDirection: TextDirection.ltr,
  );
}
