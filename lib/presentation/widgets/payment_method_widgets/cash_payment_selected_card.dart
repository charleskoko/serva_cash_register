import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashPaymentSelectedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border(
          left: BorderSide(color: Colors.grey.shade400),
          top: BorderSide(color: Colors.grey.shade400),
          bottom: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      width: MediaQuery.of(context).size.width / 2.1,
      child: Text(
        'Cash'.toUpperCase(),
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 25,
            //color: Colors.grey.shade200,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
