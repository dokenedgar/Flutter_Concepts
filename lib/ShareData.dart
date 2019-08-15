import 'package:flutter/material.dart';
import 'SecondPage.dart';

class ShareData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShareData();
  }
}

class _ShareData extends State<ShareData> {
  String msg;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Share Data - Page 1'),
     ),
     body: Column(
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
             onChanged: (text) {
               msg = text;
             },
           ),
         ),
         RaisedButton(
           child: Text('Go to P2'),
           onPressed: goToPage2,
         )
       ],
     ),
   );
  }


  void goToPage2() {
    Navigator.push(context, 
        MaterialPageRoute(builder: (context)=> SecondPage(text: msg)
        ));
  }
}