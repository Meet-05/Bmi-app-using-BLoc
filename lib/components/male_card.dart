import 'package:flutter/material.dart';
import '../bloc/gender_bloc.dart';
import './reusableWidget.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './dataForIcon.dart';

class MaleCard extends StatefulWidget {
  const MaleCard({
    Key key,
  }) : super(key: key);

  @override
  _MaleCardState createState() => _MaleCardState();
}

class _MaleCardState extends State<MaleCard> {
  final genderBloc = GenderBloc();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          initialData: false,
          stream: genderBloc.genderStream,
          builder: (context, snapshot) {
            print('male is  ${snapshot.data}');
            return ReusableWidget(
              colour: snapshot.data ? kinactiveCardColor : kactiveCardColor,
              cardData: DataForIcon(
                gender: 'Male',
                icon: FontAwesomeIcons.mars,
              ),
              handleTap: () {
                genderBloc.genderSink.add(false);
              },
            );
          }),
    );
  }
}
