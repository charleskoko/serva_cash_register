import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumericPadKey extends StatelessWidget {
  final value;
  final keyWidth;
  final keyHeight;
  NumericPadKey(this.value, {this.keyHeight, this.keyWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: keyWidth.toDouble(),
      height: keyHeight.toDouble(),
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
                  fontSize: 25,
                  color: (value == 0) ? Colors.grey.shade400 : Colors.black),
            )
          : Icon(FontAwesomeIcons.longArrowAltLeft),
    );
  }
}
