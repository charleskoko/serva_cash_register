import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/local_order_item_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';

class RegisterScreenSaleNavbarCurrentSale extends StatelessWidget {
  final TextEditingController labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      // container entete du coté avec la liste des produits.
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ListingCubit, ListingState>(builder: (context, state) {
              if (state.listing.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    FontAwesomeIcons.trashAlt,
                    color: Colors.grey.shade200,
                    size: 35,
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          final curvedValue =
                              Curves.easeInOutBack.transform(a1.value) - 1.0;
                          return Transform(
                            transform: Matrix4.translationValues(
                                0.0, curvedValue * 200, 0.0),
                            child: Opacity(
                              opacity: a1.value,
                              child: AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                content: Container(
                                  width: 500,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'attention'.toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontFamily: 'SourceSansPro'),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Voulez-vous vraiment supprimer la liste en cours?',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SourceSansPro',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Annuler',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      fontSize: 18,
                                                      color: Colors.blue),
                                                ),
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
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Effacer',
                                                  style: TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.blue,
                                                onSurface: Colors.grey,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                BlocProvider.of<ListingCubit>(
                                                        context)
                                                    .deleteList();
                                                ;
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        // ignore: missing_return
                        pageBuilder: (context, animation1, animation2) {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      FontAwesomeIcons.trashAlt,
                      color: Colors.blue.shade300,
                      size: 35,
                    ),
                  ),
                );
              }
            }),
            SizedBox(width: 20),
            BlocConsumer(
                bloc: BlocProvider.of<ListingCubit>(context),
                listener: (context, state) {
                  if (state is ListingState) {
                    if (state.snackBarFor == 'saved') {
                      Navigator.of(context).pop();
                      final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Liste en cours enregistrée sous le label "' +
                                state.label +
                                '"',
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 20),
                            textAlign: TextAlign.center,
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state.snackBarFor == 'updatedListing') {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'La liste "' +
                                state.updatedList +
                                '" été mis à jour',
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 20),
                            textAlign: TextAlign.center,
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                builder: (context, state) {
                  if (state.listing.length == 0) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                        onSurface: Colors.grey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Ventes enregistrées',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<LocalOrderItemCubit>(context)
                            .getLocalOrderItems();
                        showGeneralDialog(
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionBuilder: (context, a1, a2, widget) {
                              final curvedValue =
                                  Curves.easeInOutBack.transform(a1.value) -
                                      1.0;
                              return Transform(
                                transform: Matrix4.translationValues(
                                    0.0, curvedValue * 200, 0.0),
                                child: Opacity(
                                  opacity: a1.value,
                                  child: AlertDialog(
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    content: Container(
                                      width: 500,
                                      height: 410,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey.shade200,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              'Achats enregistrées'
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontFamily: 'SourceSansPro'),
                                            ),
                                          ),
                                          Expanded(
                                            child: BlocBuilder(
                                                bloc: BlocProvider.of<
                                                        LocalOrderItemCubit>(
                                                    context),
                                                builder: (context, state) {
                                                  if (state
                                                      is LocalOrderItemLoading) {
                                                    return Container(
                                                      child: Center(
                                                          child: SpinKitCircle(
                                                        color: Colors.black,
                                                      )),
                                                    );
                                                  } else if (state
                                                      is LocalOrderItemLoaded) {
                                                    return (state.orderItems
                                                                .length !=
                                                            0)
                                                        ? Container(
                                                            child: ListView
                                                                .builder(
                                                                    itemCount: state
                                                                        .orderItems
                                                                        .length,
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemBuilder:
                                                                        (BuildContext context,
                                                                                int index) =>
                                                                            Container(
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
                                                                              width: 50,
                                                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                                                              alignment: Alignment.center,
                                                                              child: Row(
                                                                                children: [
                                                                                  Container(
                                                                                    width: 20,
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        BlocProvider.of<LocalOrderItemCubit>(context).delete(state.orderItems[index]);
                                                                                      },
                                                                                      child: Icon(
                                                                                        FontAwesomeIcons.trashAlt,
                                                                                        color: Colors.red,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(width: 70),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      BlocProvider.of<ListingCubit>(context).selectedListFromLocal(state.orderItems[index]);
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                    child: Container(
                                                                                      width: MediaQuery.of(context).size.width / 4,
                                                                                      alignment: Alignment.centerLeft,
                                                                                      child: Text(
                                                                                        '$index - ' + state.orderItems[index].toString().toUpperCase(),
                                                                                        style: TextStyle(
                                                                                          fontFamily: 'SourceSansPro',
                                                                                          fontSize: 25,
                                                                                        ),
                                                                                        textAlign: TextAlign.left,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 30,
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.of(context).pop();
                                                                                        BlocProvider.of<ListingCubit>(context).selectedListFromLocal(state.orderItems[index]);
                                                                                        Navigator.of(context).pushNamed('/paymentMethod');
                                                                                        BlocProvider.of<PaymentMethodCubit>(context).cashSelected();
                                                                                      },
                                                                                      child: Icon(
                                                                                        FontAwesomeIcons.receipt,
                                                                                        color: Colors.green,
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            )),
                                                          )
                                                        : Container(
                                                            child: Center(
                                                              child: Text(
                                                                'Pas d\' enregistrement',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SourceSansPro',
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400),
                                                              ),
                                                            ),
                                                          );
                                                  } else {
                                                    return Container(
                                                      child: Text(
                                                          'Initial ou inconmu'),
                                                    );
                                                  }
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            transitionDuration: Duration(milliseconds: 500),
                            barrierDismissible: true,
                            barrierLabel: '',
                            context: context,
                            pageBuilder: (context, animation1, animation2) {});
                      },
                    );
                  } else {
                    return TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                        onSurface: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Enregistrer la vente',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (state.isFromLocal != null &&
                            state.isFromLocal == true) {
                          BlocProvider.of<ListingCubit>(context)
                              .updateLocalOrderItemList();
                        } else {
                          showGeneralDialog(
                              barrierColor: Colors.black.withOpacity(0.5),
                              transitionBuilder: (context, a1, a2, widget) {
                                final curvedValue =
                                    Curves.easeInOutBack.transform(a1.value) -
                                        1.0;
                                return Transform(
                                  transform: Matrix4.translationValues(
                                      0.0, curvedValue * 200, 0.0),
                                  child: Opacity(
                                    opacity: a1.value,
                                    child: AlertDialog(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      content: Container(
                                        width: 500,
                                        height: 210,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.grey.shade200,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                'label'.toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily:
                                                        'SourceSansPro'),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 450,
                                              height: 100,
                                              child: TextField(
                                                controller: labelController,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      Colors.grey.shade200,
                                                  hintText:
                                                      'Veuillez entrer un label pour la liste'
                                                          .toUpperCase(),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                            BlocBuilder<ListingCubit,
                                                ListingState>(
                                              builder: (context, state) {
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25),
                                                  child: (state
                                                              is ListingState &&
                                                          state.snackBarFor ==
                                                              'isEmpty')
                                                      ? Text(
                                                          'Veuillez entrer un label non null',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.red),
                                                        )
                                                      : (state is ListingState &&
                                                              state.snackBarFor ==
                                                                  'isNotUnique')
                                                          ? Text(
                                                              'Veuillez entrer un label pas deja utilisé',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .red),
                                                            )
                                                          : Text(''),
                                                );
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25),
                                              alignment: Alignment.centerRight,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 30,
                                              child: TextButton(
                                                child: Text(
                                                    'valider'.toUpperCase()),
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.blue,
                                                  onSurface: Colors.grey,
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<ListingCubit>(
                                                          context)
                                                      .saveNewListing(
                                                          state.listing,
                                                          labelController.text);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                              barrierDismissible: true,
                              barrierLabel: '',
                              context: context,
                              pageBuilder:
                                  (context, animation1, animation2) {});
                        }
                      },
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
