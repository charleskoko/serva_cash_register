import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavbarNewArticleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('passer à la caisse avec fond de caisse = 0');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'Crée un article',
          style: TextStyle(
              color: Colors.blueAccent,
              fontFamily: 'SourceSansPro',
              fontSize: 20),
        ),
      ),
    );
  }
}
