import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double size;
  const Barrier({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
      color: Color.fromRGBO(255, 255, 255, 0.5),
      height: 50,
      width: 100,
      decoration: BoxDecoration(color: Colors.green),
    );
  }
}
