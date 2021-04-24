import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherPaymentSelectedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
            bottom: BorderSide(color: Colors.grey.shade400),
            left: BorderSide(color: Colors.grey.shade400),
            right: BorderSide(color: Colors.grey.shade200),
          )),
      width: MediaQuery.of(context).size.width / 2.1,
      child: Text(
        'Autres'.toUpperCase(),
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
