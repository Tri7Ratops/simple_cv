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
        _getContent(context),
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
      onTapDown: (_) => _navigate(1),
      child: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return VerticalNavigation(
      navigationBackgroundColor: Theme.of(context).accentColor,
      pages: [
        VerticalNavigationItem(
          defaultIconColor: Colors.white,
          onTap: () => _navigate(0),
          page: null,
          icon: Icons.arrow_upward_rounded,
        ),
        VerticalNavigationItem(
          defaultIconColor: Colors.white,
          focusTextColor: Theme.of(context).primaryColor,
          focusIconColor: Theme.of(context).primaryColor,
          page: ContentAboutMe(),
          icon: Icons.person,
          iconTitle: "About me".toUpperCase(),
        ),
        VerticalNavigationItem(
          defaultIconColor: Colors.white,
          focusTextColor: Theme.of(context).primaryColor,
          focusIconColor: Theme.of(context).primaryColor,
          page: ContentExperiences(),
          icon: Icons.backpack_rounded,
          iconTitle: "Experience".toUpperCase(),
        ),
        VerticalNavigationItem(
          defaultIconColor: Colors.white,
          focusTextColor: Theme.of(context).primaryColor,
          focusIconColor: Theme.of(context).primaryColor,
          page: ContentSkills(),
          icon: Icons.school_rounded,
          iconTitle: "Education".toUpperCase(),
        ),
        VerticalNavigationItem(
          defaultIconColor: Colors.white,
          focusTextColor: Theme.of(context).primaryColor,
          focusIconColor: Theme.of(context).primaryColor,
          page: ContentSkills(),
          icon: Icons.trending_up,
          iconTitle: "Skills".toUpperCase(),
        ),
        VerticalNavigationItem(
          defaultIconColor: Colors.white,
          focusTextColor: Theme.of(context).primaryColor,
          focusIconColor: Theme.of(context).primaryColor,
          page: ContentSkills(),
          icon: Icons.contact_mail_rounded,
          iconTitle: "Contact".toUpperCase(),
        ),
      ],
    );
  }
}
