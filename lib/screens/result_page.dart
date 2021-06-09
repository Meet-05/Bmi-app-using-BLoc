import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusableWidget.dart';

import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String bmiValue;
  final String interpretation;

  ResultPage(
      {@required this.result,
      @required this.bmiValue,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableWidget(
                    colour: kactiveCardColor,
                    cardData: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          result,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          bmiValue,
                          style: TextStyle(
                            fontSize: 100.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          interpretation,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        BottomButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            labelText: 'ReCalculate')
                      ],
                    )))
          ],
        ));
  }
}
