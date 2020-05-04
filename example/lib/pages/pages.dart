import 'package:example/pages/page-2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'dart:html' as html;
import 'generate.dart';

class RespoEx extends StatelessWidget {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Responsive UI Example'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                key.currentState.showSnackBar(SnackBar(
                    content: Text(
                  'colS, colM and colL works only on small, medium and large screens respectively',
                  textAlign: TextAlign.center,
                )));
              }),
          IconButton(
              icon: Icon(Icons.gamepad),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SamplePage()));
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                html.window
                    .open('https://pub.dev/packages/responsive_ui', '_blank');
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Responsive(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 10,
            children: List.generate(10, (i) {
              if (i == 5) {
                return Div(
                    colS: 5,
                    offsetL: 2,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Nested Responsive inside 6th Div() with "fixed col 4 and offsetL 2"'),
                          ),
                          Responsive(
                            children: <Widget>[
                              GenerateWidget(61),
                              GenerateWidget(62),
                            ],
                          ),
                        ],
                      ),
                    ));
              }
              return GenerateWidget(i + 1);
            })),
      ),
    );
  }
}
