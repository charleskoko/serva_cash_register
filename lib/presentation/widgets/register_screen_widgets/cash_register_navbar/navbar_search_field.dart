import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/logic/article_cubit.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';

class NavbarSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashRegisterCubit, CashRegisterState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Container(
            width: 500,
            child: TextField(
              onChanged: (text) {
                BlocProvider.of<ArticleCubit>(context)
                    .articleFilter(state.products, text);
              },
              decoration: InputDecoration(
                hintText: 'Rechercher un article'.toUpperCase(),
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
                hintText: 'Rechercher un article'.toUpperCase(),
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
