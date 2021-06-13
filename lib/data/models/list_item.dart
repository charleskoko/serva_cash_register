import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, top: 5),
      width: MediaQuery.of(context).size.width,
      child: Text(
        heading.toUpperCase(),
        style: TextStyle(fontSize: 25, color: Colors.grey.shade400),
      ),
    );
  }
}

class TotalItem implements ListItem {
  final double total;

  TotalItem(this.total);

  Widget buildTitle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      padding: EdgeInsets.only(top: 5, right: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'total'.toUpperCase(),
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold),
          ),
          Text(
            total.toStringAsFixed(2),
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodItem implements ListItem {
  final Map<String, dynamic> method;
  final double total;

  PaymentMethodItem(this.method, this.total);

  Widget buildTitle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      padding: EdgeInsets.only(top: 5, right: 15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                method['paymentMethod'].toUpperCase(),
                style: TextStyle(fontSize: 25, fontFamily: 'SourceSansPro'),
              ),
              Text(
                (method['paymentMethod'] == 'PAYMENT_CASH')
                    ? method['value'].toString()
                    : total.toString(),
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          (method['paymentMethod'] == 'PAYMENT_CASH')
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rendu'.toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
                    ),
                    Text(
                      (double.parse(method['value']) - total)
                          .toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

/// A ListItem that contains data to display a message.
class ArticleItem implements ListItem {
  final Map<String, dynamic> article;

  ArticleItem(this.article);

  Widget buildTitle(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 5, bottom: 10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article['product'].label.toString() +
                                ' (' +
                                (article['quantity'].toString() + ')'),
                            style: TextStyle(
                                fontSize: 22, fontFamily: 'SourceSansPro'),
                          ),
                          Text(
                            article['price'].toString(),
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article['product']
                                .number
                                .toString()
                                .padLeft(10, '0'),
                            style: TextStyle(
                                fontSize: 22, fontFamily: 'SourceSansPro'),
                          ),
                          Text(
                            article['total'].toString(),
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 22),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
