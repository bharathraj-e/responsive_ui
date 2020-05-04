import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Div() only'),
      ),
      body: Column(
        children: <Widget>[
          Div(
              colL: 4,
              child: Card(
                child: Icon(Icons.gamepad),
              )),
          Div(
              colL: 6,
              child: Card(
                child: Icon(Icons.gamepad),
              )),
          Div(
              colL: 8,
              child: Card(
                child: Icon(Icons.gamepad),
              )),
          Div(
              colL: 2,
              child: Card(
                child: Icon(Icons.gamepad),
              ))
        ],
      ),
    );
  }
}
