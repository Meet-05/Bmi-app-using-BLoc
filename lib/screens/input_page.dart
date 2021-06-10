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

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              height: 80,
              width: double.infinity,
              color: Colors.pink,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                      initialData: '9.6',
                      stream: BmiBrain.bmiStream,
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data}',
                          style: kBottomButtonText.copyWith(fontSize: 40.0),
                        );
                      }),
                  VerticalDivider(
                    width: 50.0,
                    color: Colors.white,
                  ),
                  StreamBuilder(
                      initialData: 'You are underweight',
                      stream: BmiBrain.resultStream,
                      builder: (context, snapshot) {
                        return Text(
                          'You are ${snapshot.data}',
                          style: kLableTextStyle.copyWith(color: Colors.white),
                        );
                      })
                ],
              ),
            )
            // BottomButton(
            //   onPressed: () {
            //     BmiBrain calcBmi = BmiBrain();
            //     print(calcBmi.calculateBmi());

            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => ResultPage(
            //     //               bmiValue: calcBmi.calculateBmi(),
            //     //               result: calcBmi.getResult(),
            //     //               interpretation: calcBmi.geInterpretation(),
            //     //             )));
            //     // Navigator.pushNamed(context, '/result');
            //   },
            //   labelText: 'Calculate',
            // )
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
