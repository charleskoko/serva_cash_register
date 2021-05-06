import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/numeric_pad_cubit.dart';
import 'package:serva_cash_register/logic/payment_completed_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';

import '../numeric_pad_button.dart';

class CashPaymentContent extends StatelessWidget {
  final double grossTotal;
  CashPaymentContent(this.grossTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          BlocBuilder<NumericPadCubit, NumericPadState>(
              builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.value + ' XOF',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'SourceSansPro',
                    color: Utility.checkCash(state.value, grossTotal)
                        ? Colors.green
                        : Colors.red),
              ),
            );
          }),
          SizedBox(height: 5),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('7');
                      },
                      child: NumericPadKey(7, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('8');
                      },
                      child: NumericPadKey(8, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('9');
                      },
                      child: NumericPadKey(9, keyWidth: 100, keyHeight: 70),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('4');
                      },
                      child: NumericPadKey(4, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('5');
                      },
                      child: NumericPadKey(5, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('6');
                      },
                      child: NumericPadKey(6, keyWidth: 100, keyHeight: 70),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('1');
                      },
                      child: NumericPadKey(1, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('2');
                      },
                      child: NumericPadKey(2, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('3');
                      },
                      child: NumericPadKey(3, keyWidth: 100, keyHeight: 70),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('c');
                      },
                      child: NumericPadKey('c', keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('0');
                      },
                      child: NumericPadKey(0, keyWidth: 100, keyHeight: 70),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<NumericPadCubit>(context)
                            .keyboardClicked('delete');
                      },
                      child:
                          NumericPadKey('delete', keyWidth: 100, keyHeight: 70),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder<NumericPadCubit, NumericPadState>(
              builder: (context, state) {
            return TextButton(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Cloturer'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Utility.checkCash(state.value, grossTotal)
                    ? Colors.blue
                    : Colors.blue.shade100,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                if (Utility.checkCash(state.value, grossTotal) == true) {
                  Map<String, dynamic> paymentMethod = {
                    'paymentMethod': 'cash',
                    'value': state.value
                  };
                  Navigator.of(context).pushNamed('/paymentCompleted');
                  BlocProvider.of<PaymentCompletedCubit>(context)
                      .paymentCompleted(paymentMethod);
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
