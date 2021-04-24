import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/logic/utility.dart';

class ChangeValue extends StatelessWidget {
final List<Map<String, dynamic>> listing;
final Map<String, dynamic> paymentMethod;

ChangeValue({this.listing, this.paymentMethod});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        Utility.change(
            Utility.grossTotal(Utility.totalNet(
                listing)),
            paymentMethod),
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 30),
      ),
    );
  }
}
