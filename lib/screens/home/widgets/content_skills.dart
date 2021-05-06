import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_cv/widgets/bullet.dart';

import 'content_header.dart';

class ContentSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ContentHeader(
            data: "Skills",
          ),
          SizedBox(
            height: 32,
          ),
          _content(context),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _skillTile(
          context: context,
          title: "Flutter",
          skillLevel: 4,
        ),
        _skillTile(
          context: context,
          title: "Kotlin / JAVA",
          skillLevel: 2,
        ),
        _skillTile(
          context: context,
          title: "Swift",
          skillLevel: 2,
        ),
      ],
    );
  }

  _skillTile({required BuildContext context, required String title, required int skillLevel}) {
    if (skillLevel <= 0 || skillLevel > 5) throw ("SkillLevel must be between 1 and 5");
    List<Widget> stars = [];

    int index = 0;
    while (index < 5) {
      stars.add(
        Icon(
          Icons.star,
          color: skillLevel > 0 ? Theme.of(context).primaryColor : Colors.grey,
        ),
      );
      skillLevel--;
      index++;
    }

    return ListTile(
      leading: Container(
        height: double.infinity,
        child: Bullet(),
      ),
      title: Text(title),
      subtitle: Row(children: stars,),
    );
  }
}
