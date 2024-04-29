import 'package:flutter/material.dart';

class MyRadioWidget extends StatefulWidget {
  @override
  _MyRadioWidgetState createState() => _MyRadioWidgetState();
}

class _MyRadioWidgetState extends State<MyRadioWidget> {
  // Declare a variable to store the selected value
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text('Option 1'),
          leading: Radio(
            value: 1,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value as int?;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Option 2'),
          leading: Radio(
            value: 2,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value as int?;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Option 3'),
          leading: Radio(
            value: 3,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value as int?;
              });
            },
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Radio Example'),
      ),
      body: MyRadioWidget(),
    ),
  ));
}
