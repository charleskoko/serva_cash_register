import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';

class OrderItemDeletePopUp extends StatelessWidget {
  final Article article;
  OrderItemDeletePopUp(this.article);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
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
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Annuler',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800),
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
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        backgroundColor: Colors.red.shade100,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<ListingCubit>(context).deleteList();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
