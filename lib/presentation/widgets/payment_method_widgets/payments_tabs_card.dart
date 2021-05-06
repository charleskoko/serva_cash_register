import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';

import 'cash_payment_not_selected_card.dart';
import 'cash_payment_selected_card.dart';
import 'other_payment_not_selected_card.dart';
import 'other_payment_selected_card.dart';

class PaymentsTabsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              BlocProvider.of<PaymentMethodCubit>(context).cashSelected();
            },
            child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodInitial) {
                  return Container();
                } else if (state is CashSelected) {
                  return CashPaymentSelectedCard();
                } else {
                  return CashPaymentNotSelectedCard();
                }
              },
            ),
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<PaymentMethodCubit>(context).otherSelected();
            },
            child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                builder: (context, state) {
              if (state is PaymentMethodInitial) {
                return Container();
              } else if (state is CashSelected) {
                return OtherPaymentNotSelectedCard();
              } else {
                return OtherPaymentSelectedCard();
              }
            }),
          ),
        ],
      ),
    );
  }
}
