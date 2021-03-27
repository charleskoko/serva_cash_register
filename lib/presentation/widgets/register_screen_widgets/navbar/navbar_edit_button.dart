import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavbarEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('passer à la caisse avec fond de caisse = 0');
      },
      child: Container(
        padding: EdgeInsets.all(8),
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
