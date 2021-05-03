import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'retour',
              style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
            ),
          ),
          Text(
            'Parametres'.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro',
                fontSize: 25),
          ),
          Text(
            'retour'.toUpperCase(),
            style: TextStyle(
                fontFamily: 'SourceSansPro', fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
