import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/data/models/product.dart';

class ArticleInfo extends StatelessWidget {
  final Product product;

  const ArticleInfo({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 3),
        child: Column(
          children: [
            Container(
              width:
              MediaQuery.of(context).size.width,
              child: Text(
                product.label,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SourceSansPro'),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width:
              MediaQuery.of(context).size.width,
              child: Text(
              product.price.toString()+ ' Fr',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
