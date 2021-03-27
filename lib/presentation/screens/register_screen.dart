import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/jepht/development/serva_cash_register/lib/presentation/widgets/register_screen_widgets/navbar/navbar_articles_container.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_sale_list/register_screen_empty_sale_list.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_sale_list/register_screen_gross_total.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_sale_list/register_screen_sale_navbar_add_customer.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_sale_list/register_screen_sale_navbar_current_sale.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_sale_list/register_screen_sale_taxe.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_sale_list/register_screen_submit_button.dart';

class RegisterScreen extends StatelessWidget {
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
                  children: [NavbarArticlesContainer(), Container()],
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
                    RegisterScreenEmptySaleList(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: [
                          RegisterScreenGrossTotal(),
                          SizedBox(height: 10),
                          RegisterScreenSaleTax(),
                          SizedBox(height: 10),
                          RegisterScreenSubmitButton()
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
