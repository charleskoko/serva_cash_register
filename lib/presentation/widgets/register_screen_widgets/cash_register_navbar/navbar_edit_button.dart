import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavbarEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          'Modifier',
          style: TextStyle(
              color: Colors.blueAccent,
              fontFamily: 'SourceSansPro',
              fontSize: 20),
        ),
      ),
    );
  }
}
