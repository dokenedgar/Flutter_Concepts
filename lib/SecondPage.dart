import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String text;
  SecondPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
  
}