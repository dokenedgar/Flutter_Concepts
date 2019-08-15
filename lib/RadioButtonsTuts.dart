import 'package:flutter/material.dart';

class RadioButtonsTuts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadioButtonsTuts();
  }
}

class _RadioButtonsTuts extends State<RadioButtonsTuts> {
  String _radioValue ;
  String choice;
  @override
  void initState() {
    setState(() {
      _radioValue = "one";
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Buttons'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Some Buttons here'),
            ),
          ),
          Radio(
            value: 'one',
            groupValue: _radioValue,
            onChanged: radioChange,
          ),

          Radio(
            value: 'two',
            groupValue: _radioValue,
            onChanged: radioChange,
          ),
          RadioListTile(
            title: Text('radio tile'),
            value: 'three',
            groupValue: _radioValue,
            onChanged: radioChange,
            activeColor: Colors.green,
          ),
         // Checkbox(
           // value: false,
            //onChanged: ,
          //)

        ],
      ),
    );
  }


  void radioChange(String value) {
    setState(() {
      _radioValue = value;
    /*  switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
      */
     // debugPrint(choice); //Debug the choice in console
      debugPrint(value);

    });
  }
}