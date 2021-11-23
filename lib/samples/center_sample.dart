import 'package:flutter/material.dart';
import 'package:training/common/factories.dart';

class CenterSample extends StatelessWidget {
  const CenterSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildText(),
    );
  }
}
