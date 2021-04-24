import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        'à rendre',
        style: TextStyle(
            fontFamily: 'SourceSansPro', fontSize: 20),
      ),
    );
  }
}
