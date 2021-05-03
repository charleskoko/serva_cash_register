import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';

class RegisterScreenSubmitButton extends StatelessWidget {
  final double grossTotal;

  const RegisterScreenSubmitButton({this.grossTotal});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Somme',
                style: TextStyle(fontSize: 25, fontFamily: 'SourceSansPro'),
              ),
              Text(
                grossTotal.toStringAsFixed(2) + ' XOF',
                style: TextStyle(fontSize: 25, fontFamily: 'SourceSansPro'),
              )
            ],
          ),
        ),
        style: TextButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          backgroundColor:
              (grossTotal == 0) ? Colors.blue.shade100 : Colors.blue,
          onSurface: Colors.grey,
        ),
        onPressed: () {
          if (grossTotal != 0) {
            Navigator.of(context).pushNamed('/paymentMethod');
            BlocProvider.of<PaymentMethodCubit>(context).cashSelected();
          }
        },
      ),
    );
  }
}
