import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ignore: must_be_immutable
class VerticalNavigationItem extends Equatable {
  final Widget page;
  final Icon icon;
  double visibilityPercentage = 0.0;
  bool mostVisible = false;

  VerticalNavigationItem({required this.page, required this.icon});

  @override
  List<Object?> get props => [
        page,
        icon,
        visibilityPercentage,
        mostVisible,
      ];
}

class VerticalNavigation extends StatefulWidget {
  final List<VerticalNavigationItem> pages;
  final double navigationWidth;
  final Color? focusedColor;
  final Color? unFocusedColor;
  final Color? navigationBackgroundColor;

  const VerticalNavigation({
    Key? key,
    required this.pages,
    this.navigationWidth = 75,
    this.focusedColor,
    this.unFocusedColor,
    this.navigationBackgroundColor,
  }) : super(key: key);

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

  _defineMostVisiblePage() {
    VerticalNavigationItem? tmp;

    for (VerticalNavigationItem item in widget.pages) {
      item.mostVisible = false;

      if (tmp == null || item.visibilityPercentage > tmp.visibilityPercentage) {
        tmp = item;
      }
    }
    if (tmp != null) {
      tmp.mostVisible = true;
    }
    setState(() {});
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
          return VisibilityDetector(
            key: Key('VisibilityDetector-$index'),
            onVisibilityChanged: (visibilityInfo) {
              setState(() => widget.pages[index].visibilityPercentage = visibilityInfo.visibleFraction * 100);
              _defineMostVisiblePage();
              debugPrint('Widget ${visibilityInfo.key} is ${visibilityInfo.visibleFraction * 100}% visible');
            },
            child: AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: widget.pages[index].page,
            ),
          );
        },
      ),
    );
  }

  Widget _getNavigationColumn(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: widget.navigationWidth,
      color: widget.navigationBackgroundColor ?? Colors.purple,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.pages.length,
        itemBuilder: (context, index) {
          return Container(
            color: widget.pages[index].mostVisible ? Colors.white : widget.navigationBackgroundColor ?? Colors.purple,
            child: IconButton(
              icon: widget.pages[index].icon,
              onPressed: () {
                controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
                controller.highlight(index);
              },
            ),
          );
        },
      ),
    );
  }
}
