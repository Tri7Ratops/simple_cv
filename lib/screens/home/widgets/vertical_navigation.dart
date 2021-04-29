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
  final String? iconTitle;
  final Function()? onMostVisible;
  final Function()? lostFocus;

  double visibilityPercentage = 0.0;
  bool mostVisible = false;

  VerticalNavigationItem({
    required this.page,
    required this.icon,
    this.iconTitle,
    this.onMostVisible,
    this.lostFocus,
  });

  @override
  List<Object?> get props => [
        page,
        icon,
        iconTitle,
        visibilityPercentage,
        mostVisible,
        onMostVisible,
        lostFocus,
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

    if (widget.pages.length > 0) {
      widget.pages[0].mostVisible = true;
    }

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
    VerticalNavigationItem? mostItemVisible;
    VerticalNavigationItem? lastMostItemVisible;

    for (VerticalNavigationItem item in widget.pages) {
      if (item.mostVisible) {
        lastMostItemVisible = item;
      }
      item.mostVisible = false;

      if (mostItemVisible == null || item.visibilityPercentage > mostItemVisible.visibilityPercentage) {
        mostItemVisible = item;
      }
    }
    mostItemVisible?.mostVisible = true;
    if (mostItemVisible != lastMostItemVisible) {
      setState(() {});
      lastMostItemVisible?.lostFocus?.call();
      mostItemVisible?.onMostVisible?.call();
    }
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
              widget.pages[index].visibilityPercentage = visibilityInfo.visibleFraction * 100;
              _defineMostVisiblePage();
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
    List<Widget> list = [];

    for (VerticalNavigationItem item in widget.pages) {
      int index = widget.pages.indexOf(item);
      if (item.mostVisible) {
        list.add(
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
                controller.highlight(index);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: widget.pages[index].mostVisible ? Colors.white : widget.navigationBackgroundColor ?? Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.pages[index].icon,
                    SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      child: Container(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            item.iconTitle ?? "",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        list.add(
          GestureDetector(
            onTap: () {
              controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
              controller.highlight(index);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              color: widget.pages[index].mostVisible ? Colors.white : widget.navigationBackgroundColor ?? Colors.purple,
              child: widget.pages[index].icon,
            ),
          ),
        );
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      width: widget.navigationWidth,
      color: widget.navigationBackgroundColor ?? Colors.purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: list,
      ),
    );
  }
}
