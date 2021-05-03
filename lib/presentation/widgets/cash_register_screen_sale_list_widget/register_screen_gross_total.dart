import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenTotalNet extends StatelessWidget {
  final double totalNet;

  RegisterScreenTotalNet({@required this.totalNet});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total brute',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            totalNet.toString() + ' XOF',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
