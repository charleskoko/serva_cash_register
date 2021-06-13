import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCompletedWithCash extends StatelessWidget {
  final String cash;

  PaymentCompletedWithCash({this.cash});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Somme perçue: ' + cash + ' XOF',
        style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 30),
      ),
    );
  }
}
