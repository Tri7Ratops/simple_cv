import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final PageController _controller = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        _getHeader(),
        _getContent(),
      ],
    );
  }

  _navigate(int page) {
    _controller.animateToPage(
      page,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  Widget _getHeader() {
    return GestureDetector(
      onTap: () => _navigate(1),
      onTapDown:  (_) => _navigate(1),
      child: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }

  Widget _getContent() {
    return VerticalNavigation(
      navigationBackgroundColor: Colors.lightGreen,
      pages: [
        VerticalNavigationItem(
          focusBackgroundColor: Colors.red,
          onTap: () => _navigate(0),
          page: null,
          icon: Icons.home,
        ),
        VerticalNavigationItem(
          focusBackgroundColor: Colors.red,
          page: ContentAboutMe(),
          icon: Icons.hotel,
          iconTitle: "Mes compétences".toUpperCase(),
        ),
        VerticalNavigationItem(
          focusIconColor: Colors.green,
          focusTextColor: Colors.greenAccent,
          page: ContentExperiences(),
          icon: Icons.add,
          iconTitle: "Ceci est un très long texte qu'il faut forcement gérer, vraiment très très long. Est-ce qu'une tarte à la créme en plus suffira ?",
        ),
        VerticalNavigationItem(
          page: ContentSkills(),
          icon: Icons.calendar_today,
        ),
      ],
    );
  }
}
