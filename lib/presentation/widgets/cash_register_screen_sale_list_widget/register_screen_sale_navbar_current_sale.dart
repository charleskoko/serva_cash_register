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
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.6),
        ),
      ),
      // container entete du coté avec la liste des produits.
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ListingCubit, ListingState>(builder: (context, state) {
              if (state.listing.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    FontAwesomeIcons.trashAlt,
                    color: Colors.grey.shade300,
                    size: 20,
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<ListingCubit>(context).deleteList();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      FontAwesomeIcons.trashAlt,
                      color: Colors.blue.shade300,
                      size: 20,
                    ),
                  ),
                );
              }
            }),
            SizedBox(width: 20),
            BlocBuilder<ListingCubit, ListingState>(builder: (context, state) {
              if (state.listing.length == 0) {
                return Text(
                  'Ventes enregistrées',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20),
                );
              } else {
                return Text(
                  'Enregistrer la vente',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
