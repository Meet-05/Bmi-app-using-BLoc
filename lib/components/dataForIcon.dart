import 'package:flutter/material.dart';
import '../constants.dart';

class DataForIcon extends StatelessWidget {
  final String gender;
  final IconData icon;
  DataForIcon({this.gender, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gender, style: kLableTextStyle)
      ],
    );
  }
}
