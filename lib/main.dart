// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(
    home: Center(
      child: buildText(),
    ),
  ));
}

Text buildText([String text = 'hello world']) {
  return Text(
    text,
    // textDirection: TextDirection.ltr,
  );
}
