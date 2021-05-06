import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_header.dart';

class ContentEducation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ContentHeader(
            data: "Education",
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
        _educationTile(
          context: context,
          title: "School Name",
          desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
        SizedBox(
          height: 24,
        ),
        _educationTile(
          context: context,
          title: "Another school name",
          desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
        SizedBox(
          height: 24,
        ),
        _educationTile(
          context: context,
          title: "primary school name",
          desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
      ],
    );
  }

  Widget _educationTile({required BuildContext context, required String title, required String desc}) {
    return Row(
      children: [
        Icon(
          Icons.school_rounded,
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
