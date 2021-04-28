import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class VerticalNavigationItem extends Equatable {
  final Widget page;
  final Icon icon;

  VerticalNavigationItem({required this.page, required this.icon});

  @override
  List<Object?> get props => [
        page,
        icon,
      ];
}

class VerticalNavigation extends StatefulWidget {
  final List<VerticalNavigationItem> pages;
  final double navigationWidth;
  final Color? focusedColor;
  final Color? unFocusedColor;

  const VerticalNavigation({Key? key, required this.pages, this.navigationWidth = 75, this.focusedColor, this.unFocusedColor}) : super(key: key);

  @override
  _VerticalNavigationState createState() => _VerticalNavigationState();
}

class _VerticalNavigationState extends State<VerticalNavigation> {
  late AutoScrollController controller;

  @override
  void initState() {
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getPagesColumn(),
        _getNavigationColumn(context),
      ],
    );
  }

  Widget _getPagesColumn() {
    return Container(
      width: MediaQuery.of(context).size.width - widget.navigationWidth,
      color: Colors.yellow,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: widget.pages.length,
        itemBuilder: (context, index) {
          return AutoScrollTag(
            key: ValueKey(index),
            controller: controller,
            index: index,
            child: widget.pages[index].page,
          );
        },
      ),
    );
  }

  Widget _getNavigationColumn(BuildContext context) {
    List<Widget> items = [];

    for (VerticalNavigationItem item in widget.pages) {
      items.add(
        IconButton(
          icon: item.icon,
          onPressed: () {
            print("Scroll to ${widget.pages.indexOf(item)}");
            controller.scrollToIndex(widget.pages.indexOf(item), preferPosition: AutoScrollPosition.begin);
            controller.highlight(widget.pages.indexOf(item));
          },
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: widget.navigationWidth,
      color: Colors.purple,
      child: Column(
        children: items,
      ),
    );
  }
}
