import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/logic/utility.dart';

class ChangeTitle extends StatelessWidget {
  final List<Map<String, dynamic>> listing;
  final Map<String, dynamic> paymentMethod;

  ChangeTitle({this.listing, this.paymentMethod});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        ' à rendre: ${Utility.change(Utility.totalNet(listing), paymentMethod)}',
        style: TextStyle(
            fontFamily: 'SourceSansPro', fontSize: 30),
      ),
    );
  }
}
