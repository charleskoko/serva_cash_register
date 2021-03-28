import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreenSaleNavbarAddCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.6),
          )),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.userCircle,
                size: 30,
                color: Colors.grey.shade300,
              ),
              SizedBox(width: 20),
              Text(
                'Ajouter un client',
                style: TextStyle(
                    color: Colors.grey.shade300, fontSize: 18),
              )
            ],
          ),
          Icon(
            FontAwesomeIcons.plus,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
