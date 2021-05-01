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

  Widget _getHeader() {
    return GestureDetector(
      onTap: () => _controller.animateToPage(
        1,
        duration: Duration(seconds: 2),
        curve: Curves.easeIn,
      ),
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
          page: ContentAboutMe(),
          icon: Icons.home,
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
