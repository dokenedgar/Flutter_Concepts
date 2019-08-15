import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Device Orientations',
          style: TextStyle(color: Colors.black38),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: orientation == Orientation.portrait
          ? layoutPortrait(context)
          : layoutLandscape(),
    );
  }

  Widget layoutPortrait(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'English Premier League',
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
        ),
        Divider(),
        Row(
          children: <Widget>[
            Expanded(
              child: Text('1. '),
            ),
            Expanded(
              child: Text('Arsenal'),
            ),
          ],
        ),
        RaisedButton(
          child: Text('Go to second screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/secondScreen');
          },
        ),
        RaisedButton(
          child: Text('Call Records Clone'),
          onPressed: () => Navigator.pushNamed(context, '/layoutsTuts'),
        ),
        RaisedButton(
          child: Text('Tab Layout'),
          onPressed: () => Navigator.pushNamed(context, '/tabLayout'),
        ),
        RaisedButton(
          child: Text('Forms'),
          onPressed: () => Navigator.pushNamed(context, '/formTuts'),
        ),
        RaisedButton(
          child: Text('Radio Buttons'),
          onPressed: () => Navigator.pushNamed(context, '/radioButtons'),
        ),
        RaisedButton(
          child: Text('Share Data Among Pages'),
          onPressed: () =>
              Navigator.pushNamed(context, '/shareData'),
        ),
        RaisedButton(
          child: Text('Grid Layout'),
          onPressed: () =>
              Navigator.pushNamed(context, '/gridLayout'),
        ),
      ],
    );
  }

  Widget layoutLandscape() {
    return Center(child: Text('LANDSCAPE'));
  }
}
