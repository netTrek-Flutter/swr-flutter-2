import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconSample extends StatelessWidget {
  const IconSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.add,
          size: 12,
        ),
        Icon(
          Icons.add,
          size: 24,
          color: Colors.red,
        ), // default
        Icon(
          Icons.add,
          size: 48,
        ),
        // Icon(CupertinoIcons.camera_on_rectangle),
        // Icon(Icons.adaptive.flip_camera),
      ],
    );
  }
}
