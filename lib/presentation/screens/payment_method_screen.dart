import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/cash_payment_content.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/gross_total_card.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/other_payment_content.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/payments_tabs_card.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: TextButton(
                        child: Text(
                          'Retour',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      child: Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'SourceSansPro'),
                      ),
                    ),
                    Container(
                      child: Text(''),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ListingCubit, ListingState>(
                builder: (context, state) {
                  return GrossTotalCard(
                    total: Utility.grossTotal(Utility.totalNet(state.listing)),
                  );
                },
              ),
              PaymentsTabsCard(),
              Expanded(
                child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                  builder: (context, state) {
                    if (state is PaymentMethodInitial) {
                      return Container();
                    } else if (state is CashSelected) {
                      return BlocBuilder<ListingCubit, ListingState>(
                        builder: (context, state) {
                          return CashPaymentContent(Utility.grossTotal(
                              Utility.totalNet(state.listing)));
                        },
                      );
                    } else {
                      return OtherPaymentContent();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
