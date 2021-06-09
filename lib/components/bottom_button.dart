import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String labelText;
  BottomButton({@required this.onPressed, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            labelText,
            style: kBottomButtonText,
          ),
        ),
        color: Colors.pink,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
