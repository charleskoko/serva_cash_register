import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavbarCompanyName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Quincaillerie Ancien bel air',
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 20),
      ),
    );
  }
}
