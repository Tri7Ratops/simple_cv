import 'package:flutter/cupertino.dart';
import 'package:simple_cv/screens/home/home.dart';

class VerticalNavigationDefaultItem extends StatelessWidget {
  final Function() onTap;
  final BoxDecoration decoration;
  final VerticalNavigationItem item;

  const VerticalNavigationDefaultItem({
    required this.decoration,
    required this.onTap,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      item.animationDone = false;
    });

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child: Icon(
          item.icon,
          color: item.defaultIconColor,
        ),
      ),
    );
  }
}
