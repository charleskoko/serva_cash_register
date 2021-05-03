import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/data/models/article.dart';

class ArticleInfo extends StatelessWidget {
  final Article product;

  const ArticleInfo({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.shade400,
        padding: EdgeInsets.only(top: 3),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                product.label.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                product.price.toString() + ' XOF',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
