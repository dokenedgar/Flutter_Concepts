import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Layout'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children:
          List.generate(5, (index) {
            return Container(
              decoration: BoxDecoration(color: Colors.grey, border: Border.all(color: Colors.white)),
                  child: Center(child: Text('Item $index'))
            );
          }),
      ),
    );
  }
}
