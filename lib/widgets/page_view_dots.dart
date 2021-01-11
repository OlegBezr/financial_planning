import 'package:flutter/material.dart';

Widget _inactiveDot() {
  return new Container(
    child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 12.0,
        width: 12.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xcf080808), width: 1),
          borderRadius: BorderRadius.circular(8.0)
        ),
      ),
    )
  );
}

Widget _activeDot() {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 14.0,
        width: 14.0,
        decoration: BoxDecoration(
          color: Colors.amber[800],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.amber[800],
              spreadRadius: 0.0,
              blurRadius: 1.0
            )
          ]
        ),
      ),
    ),
  );
}

List<Widget> buildDots(int index, int length) {
  List<Widget> dots = [];

  for(int i = 0; i < length; ++i) {
    dots.add(
      i == index ? _activeDot(): _inactiveDot()
    );
  }

  if (length > 1)
    return dots;
  else
    return List<Widget>();
}