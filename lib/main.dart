import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'SecondRoute.dart';
import 'LayoutsTuts.dart';
import 'TabLayout.dart';
import 'FormTuts.dart';
import 'RadioButtonsTuts.dart';
import 'ShareData.dart';
import 'GridLayout.dart';

void main() {
  runApp(InitalizeApp());
}

class InitalizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/secondScreen': (context) => SecondRoute(),
        '/layoutsTuts': (context) => LayoutsTuts(),
        '/tabLayout': (context) => TabLayout(),
        '/formTuts': (context) => FormTuts(),
        '/radioButtons': (context) => RadioButtonsTuts(),
        '/shareData': (context) => ShareData(),
        '/gridLayout': (context) => GridLayout(),
      },
    );
  }
}
