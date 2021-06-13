import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/invoice_cubit.dart';

class NavbarSearchFieldInvoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        if (state is InvoiceLoaded) {
          return Container(
            width: 500,
            child: TextField(
              onChanged: (text) {
                BlocProvider.of<InvoiceCubit>(context).invoiceFilter(text);
              },
              decoration: InputDecoration(
                hintText: 'Rechercher un Réçu'.toUpperCase(),
                border: InputBorder.none,
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: 500,
            child: TextField(
              onChanged: (string) {},
              decoration: InputDecoration(
                hintText: 'Rechercher un Réçu'.toUpperCase(),
                border: InputBorder.none,
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
