import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_header.dart';

class ContentExperiences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ContentHeader(
            data: "Experience",
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
      children: [
        _experienceTile(
          context: context,
          title: "EXPERIENCE 1",
          desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
        SizedBox(
          height: 24,
        ),
        _experienceTile(
          context: context,
          title: "EXPERIENCE 2",
          desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
        SizedBox(
          height: 24,
        ),
        _experienceTile(
          context: context,
          title: "EXPERIENCE 3",
          desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
      ],
    );
  }

  Widget _experienceTile({required BuildContext context, required String title, required String desc}) {
    return Row(
      children: [
        Icon(
          Icons.backpack_rounded,
          size: 40,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                desc,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
