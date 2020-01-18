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
              Responsive(
                  defaultColS: 12,
                  defaultColM: 6,
                  defaultColL: 3,
                  children: <ResponsiveChild>[
                    ResponsiveChild(
                      child: Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.orangeAccent,
                            child: Column(
                              children: <Widget>[
                                Responsive(
                                  // nested Col12 widget
                                  defaultColS: 4,
                                  defaultColM: 4,
                                  defaultColL: 4,
                                  children: <ResponsiveChild>[
                                    ResponsiveChild(
                                      child: Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S4 M4 L4 Nested'),
                                        ),
                                      ),
                                    ),
                                    ResponsiveChild(
                                      child: Card(
                                        color: Colors.lime,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S4 M4 L4 Nested'),
                                        ),
                                      ),
                                    ),
                                    ResponsiveChild(
                                      child: Card(
                                        color: Colors.indigo,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S4 M4 L4 Nested'),
                                        ),
                                      ),
                                    ),
                                    ResponsiveChild(
                                      colS: 12,
                                      colM: 12,
                                      colL: 12,
                                      child: Card(
                                        color: Colors.redAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S12 M7 L12 Nested'),
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
                    ),
                    ResponsiveChild(
                      colL: 4,
                      colS: 2,
                      colM: 5,
                      offsetS: 4,
                      offsetM: 1,
                      offsetL: 2,
                      child: Card(
                        color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S2 M5 L4 \noffset S4 M1 L2 '),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      colL: 2,
                      colS: 2,
                      colM: 2,
                      child: Card(
                        color: Colors.deepPurpleAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S2 M2 L2'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      colL: 4,
                      colS: 4,
                      colM: 4,
                      child: Card(
                        color: Colors.cyanAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S4 M4 L4'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.deepPurple,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Responsive'),
              )
            ],
          ),
        ));
  }
}
