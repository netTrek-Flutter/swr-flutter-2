import 'package:flutter/material.dart';

Text buildText([String text = 'hello world']) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    // textDirection: TextDirection.ltr,
  );
}
