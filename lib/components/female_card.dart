import 'package:flutter/material.dart';
import '../bloc/gender_bloc.dart';
import './reusableWidget.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './dataForIcon.dart';

class FemaleCard extends StatefulWidget {
  const FemaleCard({
    Key key,
  }) : super(key: key);

  @override
  _FemaleCardState createState() => _FemaleCardState();
}

class _FemaleCardState extends State<FemaleCard> {
  final genderBloc = GenderBloc();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            initialData: true,
            stream: genderBloc.genderStream,
            builder: (context, snapshot) {
              print("page reloaeded");
              print('female is  ${snapshot.data}');
              return ReusableWidget(
                colour: snapshot.data ? kactiveCardColor : kinactiveCardColor,
                cardData: DataForIcon(
                  gender: 'Female',
                  icon: FontAwesomeIcons.venus,
                ),
                handleTap: () {
                  genderBloc.genderSink.add(true);
                },
              );
            }));
  }
}
