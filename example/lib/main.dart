import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  Responsive.setGlobalBreakPoints(0, 596.0, 897.0, 1232.0);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RespoEx(),
    );
  }
}

class RespoEx extends StatelessWidget {
  const RespoEx({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive UI Example'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                launchUrlString('https://pub.dev/packages/responsive_ui');
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
                    divison: const Division(
                      colS: 5,
                      offsetL: 2,
                    ),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
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
  const GenerateWidget(this.i, {Key? key}) : super(key: key);
  final int i;

  @override
  State<StatefulWidget> createState() => _GenerateWidgetState();
}

class _GenerateWidgetState extends State<GenerateWidget> {
  int colXS = 12;
  int colS = 4;
  int colM = 4;
  int colL = 4;
  int colXL = 3;
  @override
  Widget build(BuildContext context) {
    return Div(
      divison: Division(
        colXS: colXS,
        colS: colS,
        colM: colM,
        colL: colL,
        colXL: colXL,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.primaries[widget.i % Colors.primaries.length],
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Div() ${widget.i}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColXS : $colXS')),
              ),
              Slider.adaptive(
                min: 1,
                max: 12,
                divisions: 12,
                value: colXS * 1.0,
                onChanged: (value) {
                  setState(() {
                    colXS = value.toInt();
                  });
                },
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
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColXL : $colXL')),
              ),
              Slider(
                min: 1,
                max: 12,
                divisions: 11,
                value: colXL * 1.0,
                onChangeEnd: (value) {
                  setState(() {
                    colXL = value.toInt();
                  });
                },
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
