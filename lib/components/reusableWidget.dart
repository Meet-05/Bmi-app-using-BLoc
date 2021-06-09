import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final Color colour;
  final Widget cardData;
  final Function handleTap;
  ReusableWidget({this.colour, this.cardData, this.handleTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        child: cardData,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
