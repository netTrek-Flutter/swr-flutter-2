import 'package:flutter/material.dart';

import 'common/common_bottom_nav_bar.dart';
import 'common/factories.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(
      body: Center(
        child: buildText(),
      ),
    ),
  ));
}

class MyHome extends StatelessWidget {
  final String label;
  final Widget body;

  const MyHome({
    Key? key,
    this.label = 'app title',
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(label),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CommonBottomNavBar(),
    );
  }
}
