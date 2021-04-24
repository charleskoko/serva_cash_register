import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentCompletedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:40, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.checkCircle,
            color: Colors.green,
            size: 40,
          ),
          SizedBox(width: 10),
          Text(
            'Paiment terminé',
            style: TextStyle(fontSize: 40, fontFamily: 'SourceSansPro'),
          )
        ],
      ),
    );
  }
}
