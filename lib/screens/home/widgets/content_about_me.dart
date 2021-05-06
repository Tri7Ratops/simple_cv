import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_cv/screens/home/home.dart';

class ContentAboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ContentHeader(
            data: "About me",
          ),
          SizedBox(
            height: 16,
          ),
          _content(context),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  _content(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Image.asset(
            "assets/icon_user.png",
            width: MediaQuery.of(context).size.width / 2,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Hi!",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
