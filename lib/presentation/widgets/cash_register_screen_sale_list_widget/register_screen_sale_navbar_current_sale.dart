import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';

class RegisterScreenSaleNavbarCurrentSale extends StatelessWidget {
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
            BlocBuilder<ListingCubit, ListingState>(builder: (context, state) {
              if (state.listing.length == 0) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade700,
                  ),
                  child: Text(
                    'Ventes enregistrées',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade700,
                  ),
                  child: Text(
                    'Enregistrer la vente',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
