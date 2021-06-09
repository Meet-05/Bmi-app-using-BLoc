import 'package:flutter/material.dart';
import '../bloc/weight_bloc.dart';
import './reusableWidget.dart';
import '../constants.dart';
import './round_iconbutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightCard extends StatefulWidget {
  const WeightCard({
    Key key,
  }) : super(key: key);

  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  final weightBloc = WeightBloc();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ReusableWidget(
      colour: kactiveCardColor,
      cardData: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Weight',
            style: kLableTextStyle,
          ),
          StreamBuilder(
              initialData: 30,
              stream: weightBloc.weightStream,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: kNumberStyle,
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  weightBloc.eventSink.add(counterAction.increment);
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                  weightBloc.eventSink.add(counterAction.decrement);
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
