import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/presentation/widgets/price_pop_up.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_widgets/order_item_delete_pop_up.dart';

class RegisterListItem extends StatelessWidget {
  final List<Map<String, dynamic>> listing;

  RegisterListItem({this.listing});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: listing.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Slidable(
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.3,
            actions: [
              IconSlideAction(
                caption: 'Supprimer',
                color: Colors.red,
                icon: FontAwesomeIcons.trashAlt,
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
                                title: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
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
                                        'Retrait d\'un article',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                content: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 55),
                                  width: 550,
                                  height: 180,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Voulez-vous retirer cet article de la liste? Cette action'
                                        ' retirera uniquement l\'article sélectionner de la liste en cours',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SourceSansPro',
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                'Annuler',
                                                style: TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade800),
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
                                                'Retirer',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20,
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                primary: Colors.red,
                                                backgroundColor:
                                                    Colors.red.shade100,
                                                onSurface: Colors.grey,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                BlocProvider.of<ListingCubit>(
                                                        context)
                                                    .removeArticleToList(
                                                        listing[index]
                                                            ['product']);
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
                      transitionDuration: Duration(milliseconds: 500),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      // ignore: missing_return
                      pageBuilder: (context, animation1, animation2) {});
                },
              )
            ],
            child: InkWell(
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
                          child:
                              PriceEntryPopUp(curvedValue, a1, listing[index]),
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
              child: Card(
                elevation: 5,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Text(
                                          '${listing[index]['quantity'].toString()} x ${listing[index]['product'].label}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          '${listing[index]['price'].toString()} XOF',
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'SourceSansPro',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      listing[index]['total'].toString() +
                                          ' XOF',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'SourceSansPro',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
