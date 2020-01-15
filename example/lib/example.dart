import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Text('Responsive Example'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.pink,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ResponsiveRow(
                  defaultColS: 12,
                  defaultColM: 6,
                  defaultColL: 3,
                  children: <Widget>[
                    Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('S12 M6 L3'),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('S12 M6 L3'),
                      ),
                    ),
                    Card(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('S12 M6 L3'),
                      ),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.orangeAccent,
                          child: Column(
                            children: <Widget>[
                              ResponsiveRow(
                                // nested Col12 widget
                                defaultColS: 4,
                                defaultColM: 4,
                                defaultColL: 4,
                                children: <Widget>[
                                  Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('S4 M4 L4 Nested'),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.lime,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('S4 M4 L4 Nested'),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.indigo,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('S4 M4 L4 Nested'),
                                    ),
                                  ),
                                  ResponsiveColumn(
                                    colS: 12,
                                    colM: 12,
                                    colL: 12,
                                    child: Card(
                                      color: Colors.redAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            'S12 M12 L12 Nested Responsive Column '),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text('S12 M6 L3 (Nested Responsive Row)'),
                              )
                            ],
                          )),
                    ),
                    ResponsiveColumn(
                      colL: 6,
                      colS: 6,
                      colM: 6,
                      child: Card(
                        color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S6 M6 L6 Responsive Column'),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      colL: 2,
                      colS: 2,
                      colM: 2,
                      child: Card(
                        color: Colors.deepPurpleAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S2 M2 L2 Responsive Column'),
                        ),
                      ),
                    ),
                    ResponsiveColumn(
                      colL: 4,
                      colS: 4,
                      colM: 4,
                      child: Card(
                        color: Colors.cyanAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S4 M4 L4 Responsive Column'),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('S12 M6 L3'),
                      ),
                    ),
                    Card(
                      color: Colors.deepPurple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('S12 M6 L3'),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ResponsiveRow'),
              )
            ],
          ),
        ));
  }
}
