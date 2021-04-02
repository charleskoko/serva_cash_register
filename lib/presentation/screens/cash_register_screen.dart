import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_screen_sale_list_widget/register_screen_empty_sale_list.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_screen_sale_list_widget/register_screen_gross_total.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_screen_sale_list_widget/register_screen_sale_navbar_add_customer.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_screen_sale_list_widget/register_screen_sale_navbar_current_sale.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_screen_sale_list_widget/register_screen_sale_taxe.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_screen_sale_list_widget/register_screen_submit_button.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_general_widgets/article_list.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_general_widgets/loading_articles.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_widgets/cash_register_navbar/navbar_articles_container.dart';

class CashRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: Column(
                  children: [
                    NavbarArticlesContainer(),
                    Expanded(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: BlocBuilder<CashRegisterCubit, CashRegisterState>(
                          builder: (context, state) {
                        if (state is CashRegisterInitial) {
                          return Container();
                        } else if (state is ProductLoading) {
                          return LoadingArticles();
                        } else if (state is ProductLoaded) {
                          return ArticleList(
                            products: state.products,
                          );
                        } else {
                          return Container(
                            child: Text('error'),
                          );
                        }
                      }),
                    ))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    // entete
                    RegisterScreenSaleNavbarCurrentSale(),
                    //liste des achats encours
                    RegisterScreenSaleNavbarAddCustomer(),
                    //summe et bouton pour valider
                    BlocBuilder<ListingCubit, ListingState>(
                        builder: (context, state) {
                      if (state.listing.length == 0) {
                        return RegisterScreenEmptySaleList();
                      } else {
                        return Expanded(
                          child: ListView.builder(
                              itemCount: state.listing.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                '00017',
                                                style: TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                state.listing[index]['quantity']
                                                        .toString() +
                                                    'x ' +
                                                    state
                                                        .listing[index]
                                                            ['product']
                                                        .price
                                                        .toString() +
                                                    ' Fr Cfa',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'SourceSansPro'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.listing[index]['product']
                                                  .label,
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              state.listing[index]['total']
                                                      .toString() +
                                                  ' Fr Cfa',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'SourceSansPro',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                        );
                      }
                    }),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: [
                          BlocBuilder<ListingCubit, ListingState>(
                              builder: (context, state) {
                            return RegisterScreenTotalNet(
                                totalNet: Utility.totalNet(state.listing));
                          }),
                          SizedBox(height: 10),
                          RegisterScreenSaleTax(),
                          SizedBox(height: 10),
                          BlocBuilder<ListingCubit, ListingState>(
                              builder: (context, state) {
                            return RegisterScreenSubmitButton(
                              grossTotal: Utility.grossTotal(
                                  Utility.totalNet(state.listing)),
                            );
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
