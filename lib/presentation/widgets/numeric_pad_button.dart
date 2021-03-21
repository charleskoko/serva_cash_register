import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumericPadKey extends StatelessWidget {
  final value;
  NumericPadKey(this.value);
  @override
  Widget build(BuildContext context) {
    double keyWidth = 150;
    double keyHeight = 100;
    return Container(
      alignment: Alignment.center,
      width: keyWidth,
      height: keyHeight,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: (value != 'c' && value != 'delete')
              ? Colors.white
              : Colors.grey.shade200),
      child: (value != 'delete')
          ? Text(
              value.toString(),
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 30,
                  color: (value == 0) ? Colors.grey.shade400 : Colors.black),
            )
          : Icon(FontAwesomeIcons.longArrowAltLeft),
    );
  }
}
