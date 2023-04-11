
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_ranger_project/models/hatch_mark.dart';
import 'package:test_ranger_project/models/hatch_mark_label.dart';
import 'another_xlider.dart';
import 'models/handler.dart';
import 'models/tooltip/tooltip.dart';
import 'models/tooltip/tooltip_box.dart';
import 'models/trackbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Xlider Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _lowerValue = 50;

  @override
  Widget build(BuildContext context) {
    RangeValues _currentRangeValues = const RangeValues(40, 80);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _singleSlider(),
            // CustomPaint(
            //   painter:,
            //   child: const Center(
            //     child: Text(
            //       'Once upon a time...',
            //       style: TextStyle(
            //         fontSize: 40.0,
            //         fontWeight: FontWeight.w900,
            //         color: Color(0xFFFFFFFF),
            //       ),
            //     ),
            //   ),
            // ),
            // SliderTheme(
            //   data: SliderTheme.of(context).copyWith(
            //     activeTrackColor: Colors.red[700],
            //     inactiveTrackColor: Colors.red[100],
            //     trackShape: RectangularSliderTrackShape(),
            //     trackHeight: 4.0,
            //     thumbColor: Colors.redAccent,
            //     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            //     overlayColor: Colors.red.withAlpha(32),
            //     overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            //     // valueIndicatorShape:RoundSliderThumbShape(),
            //
            //   ),
            //   child: Slider(
            //     value: _lowerValue,
            //     min: 0,
            //     max: 100,
            //     divisions: 10,
            //     label: '$_lowerValue',
            //     onChanged: (value) {
            //       setState(
            //             () {
            //               _lowerValue = value;
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  LinearGradient gradient = const LinearGradient(
      colors: <Color> [
        Color(0xff7FCCE6),
        Color(0xff13B3E6),
        Color(0xff0385BF),
      ]
  );
  LinearGradient gradientText = const LinearGradient(
      colors: <Color> [
        Color(0xff009BD8),
        Color(0xff064E96),

      ]
  );

  _singleSlider({bool rtl = false}) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Single Slider ' + (rtl ? 'RTL' : 'LTR')),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FlutterSlider(
                handlerWidth: 30,
                rtl: rtl,
                handlerHeight: 30,
                values: [_lowerValue],
                max: 100,
                min: 0,
                handler: customHandler(),
                tooltip:custometooltip(),
                hatchMark: FlutterSliderHatchMark(
                  labelsDistanceFromTrackBar: 40,
                  labels:[FlutterSliderHatchMarkLabel(percent: 1,label: Text("0")),
                    FlutterSliderHatchMarkLabel(percent: 10,label: Text("1", style: TextStyle(color: Color(0xff0385BF),),)),
                    FlutterSliderHatchMarkLabel(percent: 20,label: Text("2" , style: TextStyle(color:Color(0xff0385BF)),)),
                    FlutterSliderHatchMarkLabel(percent: 30,label: Text("3", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 40,label: Text("4", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 50,label: Text("5", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 60,label: Text("6", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 70,label: Text("7", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 80,label: Text("8", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 90,label: Text("9", style: TextStyle(color: Color(0xff0385BF)))),
                    FlutterSliderHatchMarkLabel(percent: 99,label: Text("10", style: TextStyle(color:Color(0xff0385BF)),)),
                  ]
                ),
                trackBar: FlutterSliderTrackBar(activeTrackBar: BoxDecoration(gradient:gradient, borderRadius: BorderRadius.all(Radius.circular(5.0)))
                    ,activeTrackBarHeight: 7, inactiveTrackBarHeight: 7),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                  });
                },
                onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                  });
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Column(
            //     children: [
            //       Container(
            //         child: Text(
            //           _lowerValue.toInt().toString() + ' %',
            //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //         ),
            //       ),
            //
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  custometooltip(){
    log("working");
    return FlutterSliderTooltip(
        disableAnimation: false,
        textStyle: TextStyle(fontSize: 10, color: Colors.white),
        boxStyle:  FlutterSliderTooltipBox(
            decoration: BoxDecoration(
              gradient:gradient,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            )
        )
    );
  }

  FlutterSliderHandler customHandler() {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: RotationTransition(
        turns: new AlwaysStoppedAnimation(45 / 360) ,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 0.10, blurRadius: 10, offset: Offset(0, 2))],
          ),
        ),
      ),
    );
  }

}









