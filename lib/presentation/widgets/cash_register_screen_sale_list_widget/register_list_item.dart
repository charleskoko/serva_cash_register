import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';

class RegisterListItem extends StatelessWidget {
  final List<Map<String, dynamic>> listing;

  RegisterListItem({this.listing});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                            contentPadding: EdgeInsets.zero,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            content: Container(
                              width: 500,
                              height: 150,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade300))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Attention'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'SourceSansPro',
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Voulez-vous vraiment supprimer cette article de la liste en cours?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          child: Text('Non'),
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
                                            'Oui',
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 15,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor:
                                                Colors.red.shade300,
                                            onSurface: Colors.grey,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            BlocProvider.of<ListingCubit>(
                                                    context)
                                                .removeArticleToList(
                                                    listing[index]['product']);
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
                    transitionDuration: Duration(milliseconds: 200),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context,
                    // ignore: missing_return
                    pageBuilder: (context, animation1, animation2) {});
              },
            )
          ],
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        '00017',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro', fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Text(
                        listing[index]['quantity'].toString() +
                            'x ' +
                            listing[index]['product'].price.toString() +
                            ' XOF',
                        style: TextStyle(
                            fontSize: 15, fontFamily: 'SourceSansPro'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listing[index]['product'].label,
                      style:
                          TextStyle(fontFamily: 'SourceSansPro', fontSize: 17),
                    ),
                    Text(
                      listing[index]['total'].toString() + ' XOF',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
