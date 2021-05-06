import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  final Color color;
  final double size;

  const Bullet({this.color = Colors.black, this.size = 10.0});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
