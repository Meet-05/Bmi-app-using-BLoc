import '../components/age_card.dart';
import '../screens/result_page.dart';
import 'package:flutter/material.dart';
import '../bloc/gender_bloc.dart';
import '../constants.dart';
import '../components/reusableWidget.dart';
import '../components/dataForIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/weight_card.dart';
import '../components/bottom_button.dart';

// import '../bmi_brain.dart';
import '../components/height_card.dart';
import '../bloc/brain.dart';
import '../components/female_card.dart';
import '../components/male_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 10;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bmi Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GenderRow(),
            HeightCard(),
            Expanded(
                child: Row(
              children: [WeightCard(), AgeCard()],
            )),
            BottomButton(
              onPressed: () {
                BmiBrain calcBmi = BmiBrain();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiValue: calcBmi.calculateBmi(),
                              result: calcBmi.getResult(),
                              interpretation: calcBmi.geInterpretation(),
                            )));
                Navigator.pushNamed(context, '/result');
              },
              labelText: 'Calculate',
            )
          ],
        ));
  }
}

class GenderRow extends StatelessWidget {
  const GenderRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genderBloc = GenderBloc();
    return Expanded(
        child: Row(
      children: [
        Expanded(
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
        ),
        Expanded(
            child: StreamBuilder(
                initialData: true,
                stream: genderBloc.genderStream,
                builder: (context, snapshot) {
                  print('female is  ${snapshot.data}');
                  return ReusableWidget(
                    colour:
                        snapshot.data ? kactiveCardColor : kinactiveCardColor,
                    cardData: DataForIcon(
                      gender: 'Female',
                      icon: FontAwesomeIcons.venus,
                    ),
                    handleTap: () {
                      genderBloc.genderSink.add(true);
                    },
                  );
                }))
      ],
    ));
  }
}

//creating our own widget from scratch
