import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';

class RegisterScreenSaleNavbarCurrentSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.6),
        ),
      ),
      // container entete du coté avec la liste des produits.
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.trashAlt,
              color: Colors.grey.shade300,
            ),
            BlocBuilder<CashRegisterCubit, CashRegisterState>(
                builder: (context, state) {
              if (state is CashRegisterInitial) {
                return Text(
                  'Vente en cours',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                );
              } else {
                return Text(
                  'Enregistrer la vente',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                );
              }
            }),
            Icon(
              FontAwesomeIcons.percent,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
