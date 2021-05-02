import 'package:flutter/cupertino.dart';
import 'package:simple_cv/screens/home/home.dart';

class VerticalNavigationFocusItem extends StatefulWidget {
  final Function() onTap;
  final BoxDecoration decoration;
  final bool reversed;
  final VerticalNavigationItem item;

  const VerticalNavigationFocusItem({
    required this.decoration,
    required this.onTap,
    required this.reversed,
    required this.item,
  });

  @override
  _VerticalNavigationFocusItemState createState() => _VerticalNavigationFocusItemState();
}

class _VerticalNavigationFocusItemState extends State<VerticalNavigationFocusItem> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (!widget.item.animationDone) {
        widget.item.animationDone = true;
        setState(() {});
      }
    });

    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          height: widget.item.animationDone ? 5000 : 100,
          curve: Curves.easeIn,
          padding: const EdgeInsets.all(10),
          decoration: widget.decoration.copyWith(color: widget.item.focusBackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.item.icon,
                color: widget.item.focusIconColor,
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: Container(
                  child: RotatedBox(
                    quarterTurns: widget.reversed ? 3 : 1,
                    child: Text(
                      widget.item.iconTitle ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: widget.item.focusTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
