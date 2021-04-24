import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenSaleTax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'TVA',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'SourceSansPro',
                color: Colors.grey.shade500),
          ),
          Text(
            '18%',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 15,
                color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }
}
