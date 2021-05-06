import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/numeric_pad_cubit.dart';
import 'package:serva_cash_register/logic/payment_completed_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/payment_completed_widget/change_title.dart';
import 'package:serva_cash_register/presentation/widgets/payment_completed_widget/change_value.dart';
import 'package:serva_cash_register/presentation/widgets/payment_completed_widget/payment_completed_title.dart';
import 'package:serva_cash_register/presentation/widgets/payment_completed_widget/payment_completed_with_cash.dart';
import 'package:serva_cash_register/data/models/list_item.dart';
import 'package:serva_cash_register/data/models/list_item.dart';

class PaymentCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            PaymentCompletedTitle(),
                            ChangeTitle(),
                            BlocBuilder<ListingCubit, ListingState>(
                              builder: (context, listState) {
                                return BlocBuilder<PaymentCompletedCubit,
                                        PaymentCompletedState>(
                                    builder: (context, state) {
                                  return ChangeValue(
                                    listing: listState.listing,
                                    paymentMethod: state.paymentMethod,
                                  );
                                });
                              },
                            ),
                            BlocBuilder<PaymentCompletedCubit,
                                PaymentCompletedState>(
                              builder: (context, state) {
                                if (state.paymentMethod['paymentMethod'] ==
                                    'cash') {
                                  return PaymentCompletedWithCash(
                                      cash: state.paymentMethod['value']);
                                } else {
                                  return BlocBuilder<ListingCubit,
                                      ListingState>(
                                    builder: (context, listState) {
                                      return Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          'de ' +
                                              Utility.grossTotal(
                                                      Utility.totalNet(
                                                          listState.listing))
                                                  .toString() +
                                              ' XOF',
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 20),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.fileInvoice),
                                      SizedBox(width: 10),
                                      Text(
                                        'Imprimer le réçu',
                                        style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 17,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue.shade100,
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  print('Pressed');
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  width: 300,
                                  child: Text(
                                    'Nouvelle vente',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 20),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/register', (route) => false);
                                  BlocProvider.of<ListingCubit>(context)
                                      .deleteList();
                                  BlocProvider.of<NumericPadCubit>(context)
                                      .keyboardInitialized();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        elevation: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              left: BorderSide(color: Colors.grey.shade400),
                              top: BorderSide(color: Colors.grey.shade400),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 2.6,
                          child: BlocBuilder<ListingCubit, ListingState>(
                            builder: (context, listState) {
                              return BlocBuilder<PaymentCompletedCubit,
                                      PaymentCompletedState>(
                                  builder: (context, state) {
                                List<ListItem> items = Utility.bill(
                                    listState.listing, state.paymentMethod);
                                return ListView.builder(
                                    itemCount: items.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final item = items[index];

                                      return Container(
                                          child: item.buildTitle(context));
                                    });
                                ;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
