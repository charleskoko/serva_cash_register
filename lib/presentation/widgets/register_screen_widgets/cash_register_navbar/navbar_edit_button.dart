import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavbarEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 80,
        padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
        child: Icon(
          FontAwesomeIcons.arrowCircleLeft,
          size: 40,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
