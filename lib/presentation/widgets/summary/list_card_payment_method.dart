import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/data/models/invoice.dart';
import 'package:serva_cash_register/logic/utility.dart';

import 'card_widget.dart';

class ListCardPaymentMethod extends StatelessWidget {
  final List<Invoice> invoices;
  double sales;
  ListCardPaymentMethod(this.invoices, this.sales);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            (invoices.isNotEmpty)
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CardWidget(
                            backgroundColor: 0xffED702E,
                            logo: 'Orange',
                            amount: Utility.totalAmountPerPaymentMethod(
                                invoices, 'orange'),
                            totalSales:
                                Utility.totalNumberSalesPerPaymentMethod(
                                    invoices, 'orange'),
                            percent: Utility.percentOfSalePerPaymentMethod(
                                total: sales,
                                methodPaymentTotal:
                                    Utility.totalAmountPerPaymentMethod(
                                        invoices, 'orange')),
                          ),
                          SizedBox(width: 15),
                          CardWidget(
                            backgroundColor: 0xffC6CC42,
                            logo: 'Moov',
                            amount: Utility.totalAmountPerPaymentMethod(
                                invoices, 'Moov'),
                            totalSales:
                                Utility.totalNumberSalesPerPaymentMethod(
                                    invoices, 'Moov'),
                            percent: Utility.percentOfSalePerPaymentMethod(
                                total: sales,
                                methodPaymentTotal:
                                    Utility.totalAmountPerPaymentMethod(
                                        invoices, 'Moov')),
                          ),
                          SizedBox(width: 15),
                          CardWidget(
                            backgroundColor: 0xffF7CD46,
                            logo: 'MTN',
                            amount: Utility.totalAmountPerPaymentMethod(
                                invoices, 'MTN'),
                            totalSales:
                                Utility.totalNumberSalesPerPaymentMethod(
                                    invoices, 'MTN'),
                            percent: Utility.percentOfSalePerPaymentMethod(
                                total: sales,
                                methodPaymentTotal:
                                    Utility.totalAmountPerPaymentMethod(
                                        invoices, 'MTN')),
                          ),
                          SizedBox(width: 15),
                          CardWidget(
                            logo: 'CASH',
                            amount: Utility.totalAmountPerPaymentMethod(
                                invoices, 'cash'),
                            totalSales:
                                Utility.totalNumberSalesPerPaymentMethod(
                                    invoices, 'cash'),
                            percent: Utility.percentOfSalePerPaymentMethod(
                                total: sales,
                                methodPaymentTotal:
                                    Utility.totalAmountPerPaymentMethod(
                                        invoices, 'cash')),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
