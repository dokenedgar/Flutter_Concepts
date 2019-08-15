import 'package:flutter/material.dart';

// SomeStatefulWidgets
class SecondRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondRoute();
  }
}

class _SecondRoute extends State<SecondRoute> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtController.addListener(updateSecondTextField);
  }

  @override
  void dispose() {
    txtController.dispose();
    secondController.dispose();
    super.dispose();
  }

  TextEditingController txtController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtController,
              decoration: InputDecoration(
                  labelText: 'Enter something',
                  hintText: 'Another something',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: secondController,
              enabled: false,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0)),
                // border: InputBorder.none
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
                //print(txtController.text);
              },
            ),
          ),
        ],
      ),
    );
  }

  void updateSecondTextField() {
    //print('current val of controller: ${txtController.text}');
    setState(() {
      secondController.text = txtController.text;
    });
  }
}
