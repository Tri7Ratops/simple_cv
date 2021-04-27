import 'package:flutter/material.dart';
import 'package:simple_cv/config/routes.dart';
import 'package:simple_cv/config/theme.dart';

import 'screens/home/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martin JNR',
      theme: MyAppTheme.light(),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (BuildContext context) => HomeScreen()
      },
    );
  }
}
