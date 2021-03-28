import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Somme',
              style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
            ),
            Text(
              '0,00',
              style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
            )
          ],
        ),
      ),
      style: TextButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        backgroundColor: Colors.blue.shade100,
        onSurface: Colors.grey,
      ),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}
