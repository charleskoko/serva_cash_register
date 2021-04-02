import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenSubmitButton extends StatelessWidget {
  final double grossTotal;

  const RegisterScreenSubmitButton({this.grossTotal});
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
              grossTotal.toString(),
              style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
            )
          ],
        ),
      ),
      style: TextButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        backgroundColor: (grossTotal == 0)?Colors.blue.shade100 : Colors.blue,
        onSurface: Colors.grey,
      ),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}
