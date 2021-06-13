import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/invoice_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/navbar_search_field_invoice.dart';

class InvoicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController labelController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    padding: EdgeInsets.all(12.5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                        right: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 80,
                            child: TextButton(
                              child: Icon(
                                FontAwesomeIcons.arrowCircleLeft,
                                size: 40,
                                color: Colors.grey.shade800,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: NavbarSearchFieldInvoice(),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  BlocBuilder<InvoiceCubit, InvoiceState>(
                    builder: (context, state) {
                      if (state is InvoiceLoading) {
                        return Expanded(
                          child: Container(
                            child: Center(
                              child: SpinKitCircle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      } else if (state is InvoiceLoaded) {
                        return Expanded(
                          child: (state.invoices.length != 0)
                              ? Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: ListView.builder(
                                    itemCount: state.invoices.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final invoice = state.invoices[index];
                                      return Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .grey.shade200),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child: Text(
                                                                invoice.number
                                                                    .toString()
                                                                    .padLeft(10,
                                                                        '0'),
                                                                style:
                                                                    TextStyle(
                                                                  decoration: (Utility
                                                                          .isInvoiceCanceled(
                                                                              invoice))
                                                                      ? TextDecoration
                                                                          .lineThrough
                                                                      : TextDecoration
                                                                          .none,
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  fontSize: 25,
                                                                  letterSpacing:
                                                                      1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child: Text(
                                                                invoice.order
                                                                    .number
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  decoration: (Utility
                                                                          .isInvoiceCanceled(
                                                                              invoice))
                                                                      ? TextDecoration
                                                                          .lineThrough
                                                                      : TextDecoration
                                                                          .none,
                                                                  fontSize: 25,
                                                                  letterSpacing:
                                                                      1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child: Text(
                                                                invoice.total
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  decoration: (Utility
                                                                          .isInvoiceCanceled(
                                                                              invoice))
                                                                      ? TextDecoration
                                                                          .lineThrough
                                                                      : TextDecoration
                                                                          .none,
                                                                  fontSize: 25,
                                                                  letterSpacing:
                                                                      1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child: Text(
                                                                invoice
                                                                    .paymentMethod
                                                                    .method
                                                                    .toString()
                                                                    .toUpperCase(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  decoration: (Utility
                                                                          .isInvoiceCanceled(
                                                                              invoice))
                                                                      ? TextDecoration
                                                                          .lineThrough
                                                                      : TextDecoration
                                                                          .none,
                                                                  fontSize: 25,
                                                                  letterSpacing:
                                                                      1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 5)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: (Utility.isInvoiceCanceled(
                                                      invoice))
                                                  ? Container()
                                                  : InkWell(
                                                      onTap: () {
                                                        showGeneralDialog(
                                                            barrierColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5),
                                                            transitionBuilder:
                                                                (context,
                                                                    a1,
                                                                    a2,
                                                                    widget) {
                                                              final curvedValue = Curves
                                                                      .easeInOutBack
                                                                      .transform(
                                                                          a1.value) -
                                                                  1.0;
                                                              return Transform(
                                                                transform: Matrix4
                                                                    .translationValues(
                                                                        0.0,
                                                                        curvedValue *
                                                                            200,
                                                                        0.0),
                                                                child: Opacity(
                                                                  opacity:
                                                                      a1.value,
                                                                  child: AlertDialog(
                                                                      title: Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              FontAwesomeIcons.infoCircle,
                                                                              size: 40,
                                                                              color: Colors.red.shade400,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 15,
                                                                            ),
                                                                            Text(
                                                                              'Annuler la facture',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 25, fontWeight: FontWeight.bold),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      contentPadding: EdgeInsets.zero,
                                                                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                                                                      content: Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        padding:
                                                                            EdgeInsets.only(left: 55),
                                                                        width:
                                                                            550,
                                                                        height:
                                                                            180,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Text(
                                                                              'Voulez-vous annuler cet facture? '
                                                                              'Cette action est irreversible et annulera la facture',
                                                                              style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontFamily: 'SourceSansPro',
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                            Container(
                                                                              padding: EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  TextButton(
                                                                                    child: Text(
                                                                                      'Annuler',
                                                                                      style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                                                                                    ),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.green.shade300,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                  ),
                                                                                  SizedBox(width: 20),
                                                                                  TextButton(
                                                                                    child: Text(
                                                                                      'Confirmer l\'annulation',
                                                                                      style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontFamily: 'SourceSansPro',
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                    ),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.red,
                                                                                      backgroundColor: Colors.red.shade100,
                                                                                      onSurface: Colors.grey,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      BlocProvider.of<InvoiceCubit>(context).cancelInvoice(invoice);
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                                ),
                                                              );
                                                            },
                                                            transitionDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            barrierDismissible:
                                                                true,
                                                            barrierLabel: '',
                                                            context: context,
                                                            // ignore: missing_return
                                                            pageBuilder: (context,
                                                                animation1,
                                                                animation2) {});
                                                      },
                                                      child: Container(
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .grey.shade200),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Icon(
                                                                FontAwesomeIcons
                                                                    .windowClose,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  child: Center(
                                    child: Text(
                                        'Pas d\'achat enregistrer pour le moment durant votre service', style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 25,
                                      color: Colors.grey.shade500
                                    ),),
                                  ),
                                ),
                        );
                      } else {
                        return Container(
                          child: Text('inconnu'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
