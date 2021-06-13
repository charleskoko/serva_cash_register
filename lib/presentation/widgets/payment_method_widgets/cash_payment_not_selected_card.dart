import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashPaymentNotSelectedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.grey.shade400),
        right: BorderSide(color: Colors.grey.shade200),
      )),
      width: MediaQuery.of(context).size.width / 2.1,
      child: Text(
        'Cash'.toUpperCase(),
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 25,
            color: Colors.grey.shade300,
           ),
      ),
    );
  }
}
