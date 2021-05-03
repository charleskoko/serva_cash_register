import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenSaleTax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'TVA',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'SourceSansPro',
                color: Colors.grey),
          ),
          Text(
            '18%',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
