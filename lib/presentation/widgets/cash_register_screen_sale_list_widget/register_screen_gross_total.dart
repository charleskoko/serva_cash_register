import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenGrossTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total brute',
            style: TextStyle(
                fontFamily: 'SourceSansPro', fontSize: 20),
          ),
          Text(
            '0,00',
            style: TextStyle(
                fontFamily: 'SourceSansPro', fontSize: 20),
          )
        ],
      ),
    );
  }
}
