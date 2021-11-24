import 'package:flutter/material.dart';
import 'package:training/common/factories.dart';

class ContainerSample extends StatelessWidget {
  const ContainerSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const SizedBox(
    //   width: 150,
    //   child: ColoredBox(
    //     color: Colors.green,
    //     child: Text('hello'),
    //   ),
    // );
    return Container(
      width: 150,
      height: 150,
      color: Colors.red,
      // alignment: Alignment.center,
      // alignment: Alignment.bottomRight,
      alignment: const Alignment(-0.4, 0.4),
      child: const Text(
        'hello world 2',
        style: TextStyle(backgroundColor: Colors.green),
      ),
    );
  }
}
