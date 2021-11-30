import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:training/main/my_app.dart';
import 'package:training/samples/navigation/routing.dart';

class CommonBottomNavBar extends StatelessWidget {
  int? currentIndex;

  CommonBottomNavBar(
    Widget body, {
    Key? key,
  }) : super(key: key) {
    currentIndex = isListView(body) ? 0 : null;
    currentIndex ??= isGridView(body) ? 1 : null;
    currentIndex ??= isImageView(body) ? 2 : null;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex ?? 0,
      onTap: (value) => Navigator.pushNamed(
        context,
        pages[value], /*arguments: 1*/
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted),
          label: 'list',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_on),
          label: 'grid',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'image',
        )
      ],
    );
  }
}

CommonBottomNavBar? buildCommonBottomNavBar(Widget body) =>
    (isListView(body) || isGridView(body) || isImageView(body))
        ? CommonBottomNavBar(body)
        : null;
