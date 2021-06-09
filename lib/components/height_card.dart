import 'package:flutter/material.dart';
import '../bloc/brain.dart';
import './reusableWidget.dart';
import '../bloc/slider.dart';
import '../constants.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({
    Key key,
  }) : super(key: key);

  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  final sliderBloc = SliderBloc();
  // double height = 180;
  @override
  Widget build(BuildContext context) {
    // print('ddddd $height.');
    return Expanded(
        child: ReusableWidget(
      colour: kactiveCardColor,
      cardData: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Height',
            style: kLableTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              StreamBuilder<Object>(
                  initialData: 180.0,
                  stream: sliderBloc.heightStream,
                  builder: (context, snapshot) {
                    double height = snapshot.data;
                    return Text(
                      '${height.round()}',
                      style: kNumberStyle,
                    );
                  }),
              Text(
                'cm',
                style: kLableTextStyle,
              ),
            ],
          ),
          SliderTheme(
              //use the default theme for slider but customize some parameters
              data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  activeTrackColor: Colors.white,
                  thumbColor: Colors.pink,
                  overlayColor:
                      Color(0x29EB1555), //first two caharcters set opacity
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
              child: StreamBuilder<Object>(
                  initialData: 180.0,
                  stream: sliderBloc.heightStream,
                  builder: (context, snapshot) {
                    return Slider(
                        value: snapshot.data,
                        min: 110.0,
                        max: 220.0,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.white,
                        onChanged: (double value) {
                          // setState(() {
                          //   height = value;
                          // });
                          sliderBloc.heightSink.add(value);
                        });
                  })),
        ],
      ),
    ));
  }
}
