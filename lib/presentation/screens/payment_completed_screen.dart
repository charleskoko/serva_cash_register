import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/payment_completed_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';

class PaymentCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Text(
                  'Paiment',
                  style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 30),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.checkCircle,
                                    color: Colors.green,
                                    size: 60,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Paiment terminé',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontFamily: 'SourceSansPro'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'à rendre',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 25),
                              ),
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<ListingCubit, ListingState>(
                              builder: (context, listState) {
                                return BlocBuilder<PaymentCompletedCubit,
                                        PaymentCompletedState>(
                                    builder: (context, state) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      Utility.change(
                                          Utility.grossTotal(Utility.totalNet(
                                              listState.listing)),
                                          state.paymentMethod),
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 50),
                                    ),
                                  );
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<PaymentCompletedCubit,
                                PaymentCompletedState>(
                              builder: (context, state) {
                                if (state.paymentMethod['paymentMethod'] ==
                                    'cash') {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'de ' +
                                          state.paymentMethod['value'] +
                                          ' XOF',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 25),
                                    ),
                                  );
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
                                              fontSize: 25),
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
                                  padding: EdgeInsets.all(10),
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.fileInvoice),
                                      SizedBox(width: 10),
                                      Text(
                                        'Imprimer le réçu',
                                        style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 20,
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
                                  print('Pressed');
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
                              horizontal: 10, vertical: 30),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border(
                                left: BorderSide(color: Colors.grey.shade400),
                                top: BorderSide(color: Colors.grey.shade400),
                              )),
                          width: MediaQuery.of(context).size.width / 2.6,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Article(s)'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                ),
                              ),
                              BlocBuilder<ListingCubit, ListingState>(
                                  builder: (context, state) {
                                return ListView.builder(
                                    itemCount: state.listing.length,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text((index + 1).toString()),
                                                  SizedBox(width: 10),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(state
                                                                .listing[index]
                                                                    ['product']
                                                                .label +
                                                            ' (' +
                                                            state.listing[index]
                                                                    ['quantity']
                                                                .toString() +
                                                            ')'),
                                                        Text(state
                                                            .listing[index]
                                                                ['product']
                                                            .price
                                                            .toString()),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text('0017')
                                            ],
                                          ),
                                        ));
                              })
                            ],
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
