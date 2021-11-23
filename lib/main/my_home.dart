import 'package:flutter/material.dart';
import 'package:training/common/common_bottom_nav_bar.dart';
import 'package:training/common/factories.dart';

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
