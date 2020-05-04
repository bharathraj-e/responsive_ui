import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter/material.dart';

class GenerateWidget extends StatefulWidget {
  GenerateWidget(this.i);
  final int i;

  @override
  _GenerateWidgetState createState() => _GenerateWidgetState();
}

class _GenerateWidgetState extends State<GenerateWidget> {
  int colS = 4;
  int colM = 4;
  int colL = 4;
  @override
  Widget build(BuildContext context) {
    var sliderTheme = SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.red[700],
      inactiveTrackColor: Colors.red[100],
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      thumbColor: Colors.redAccent,
      overlayColor: Colors.red.withAlpha(32),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      activeTickMarkColor: Colors.red[700],
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorColor: Colors.redAccent,
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
    );
    return Div(
      colS: colS,
      colM: colM,
      colL: colL,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
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
              SliderTheme(
                data: sliderTheme,
                child: Slider(
                  min: 1,
                  max: 12,
                  divisions: 12,
                  value: colS * 1.0,
                  onChanged: (value) {},
                  onChangeEnd: (value) {
                    setState(() {
                      colS = value.toInt();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColM : $colM')),
              ),
              SliderTheme(
                data: sliderTheme,
                child: Slider(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('ColL : $colL')),
              ),
              SliderTheme(
                data: sliderTheme,
                child: Slider(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
