import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/payment_completed_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';

class OtherPaymentContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.mobile),
                        SizedBox(width: 5),
                        Text(
                          'Mobile money',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    //Icon(FontAwesomeIcons.sortDown)
                  ],
                ),
                InkWell(
                  onTap: () {
                    Map<String, dynamic> paymentMethod = {
                      'paymentMethod': 'PAYMENT_ORANGE_MONEY',
                      'value': null
                    };
                    Navigator.of(context).pushNamed('/paymentCompleted');
                    BlocProvider.of<PaymentCompletedCubit>(context)
                        .paymentCompleted(paymentMethod);
                    BlocProvider.of<ListingCubit>(context)
                        .saveOrder(paymentMethod, withMobile: true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Text(
                      'Orange money',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Map<String, dynamic> paymentMethod = {
                      'paymentMethod': 'PAYMENT_MTN_MOBILE',
                      'value': null
                    };
                    Navigator.of(context).pushNamed('/paymentCompleted');
                    BlocProvider.of<PaymentCompletedCubit>(context)
                        .paymentCompleted(paymentMethod);
                    BlocProvider.of<ListingCubit>(context)
                        .saveOrder(paymentMethod, withMobile: true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Text(
                      'MTN Mobile money',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Map<String, dynamic> paymentMethod = {
                      'paymentMethod': 'PAYMENT_MOOV_MOBILE',
                      'value': null
                    };
                    Navigator.of(context).pushNamed('/paymentCompleted');
                    BlocProvider.of<PaymentCompletedCubit>(context)
                        .paymentCompleted(paymentMethod);
                    BlocProvider.of<ListingCubit>(context)
                        .saveOrder(paymentMethod, withMobile: true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Moov Flooz',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
