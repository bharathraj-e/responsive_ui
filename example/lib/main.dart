import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:responsive_ui/responsive_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RespoEx(),
    );
  }
}

class RespoEx extends StatelessWidget {
  final GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      appBar: AppBar(
        title: Text('Responsive UI Example'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                sKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                  'colS, colM and colL works only on small, medium and large screens respectively',
                  textAlign: TextAlign.center,
                )));
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
            children: List.generate(20, (i) {
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

class GenerateWidget extends StatefulWidget {
  GenerateWidget(this.i);
  final int i;

  @override
  _GenerateWidgetState createState() => _GenerateWidgetState();
}

class _GenerateWidgetState extends State<GenerateWidget> {
  RandomColor _randomColor = RandomColor();
  int colS = 4;
  int colM = 4;
  int colL = 4;
  @override
  Widget build(BuildContext context) {
    return Div(
      colS: colS,
      colM: colM,
      colL: colL,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color:
              _randomColor.randomColor(colorBrightness: ColorBrightness.light),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Div() ${widget.i}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColS : $colS')),
              ),
              Slider.adaptive(
                min: 1,
                max: 12,
                divisions: 12,
                value: colS * 1.0,
                onChanged: (value) {
                  setState(() {
                    colS = value.toInt();
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColM : $colM')),
              ),
              Slider(
                min: 1,
                max: 12,
                divisions: 12,
                value: colM * 1.0,
                onChangeEnd: (value) {
                  setState(() {
                    colM = value.toInt();
                  });
                },
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColL : $colL')),
              ),
              Slider(
                min: 1,
                max: 12,
                divisions: 11,
                value: colL * 1.0,
                onChangeEnd: (value) {
                  setState(() {
                    colL = value.toInt();
                  });
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
