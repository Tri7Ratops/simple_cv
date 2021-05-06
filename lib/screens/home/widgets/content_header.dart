import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  final String data;

  const ContentHeader({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          data.toUpperCase(),
          style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}