import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './reusableWidget.dart';
import './round_iconbutton.dart';
import '../bloc/age_block.dart';
import '../constants.dart';

class AgeCard extends StatefulWidget {
  const AgeCard({
    Key key,
  }) : super(key: key);

  @override
  _AgeCardState createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  final ageBloc = AgeBloc();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableWidget(
        colour: kactiveCardColor,
        cardData: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Age',
              style: kLableTextStyle,
            ),
            StreamBuilder(
                initialData: 20,
                stream: ageBloc.ageStream,
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
                    ageBloc.eventSink.add(counterAction.increment);
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    ageBloc.eventSink.add(counterAction.decrement);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
