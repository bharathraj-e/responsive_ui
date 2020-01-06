import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 1'),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 2'),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 3'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.orangeAccent,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Responsive(
                              // nested Col12 widget
                              defaultColS: 4,
                              defaultColM: 4,
                              defaultColL: 4,
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nested child 1'),
                                  ),
                                ),
                                Container(
                                  color: Colors.lime,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nested child 2'),
                                  ),
                                ),
                                Container(
                                  color: Colors.indigo,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nested child 3'),
                                  ),
                                ),
                                Col(
                                  colS: 12,
                                  colM: 12,
                                  colL: 12,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.redAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Nested ColChild'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('child 4 ~ Nested Col12 Widget'),
                            )
                          ],
                        )),
                    Col(
                      colL: 6,
                      colS: 6,
                      colM: 6,
                      child: Container(
                        color: Colors.cyan,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ColChild 1'),
                        ),
                      ),
                    ),
                    Col(
                      colL: 6,
                      colS: 6,
                      colM: 6,
                      child: Container(
                        color: Colors.cyanAccent,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ColChild 2'),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 5'),
                      ),
                    ),
                    Container(
                      color: Colors.deepPurple,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 6'),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Col12 Widget'),
              )
            ],
          ),
        ));
  }
}
