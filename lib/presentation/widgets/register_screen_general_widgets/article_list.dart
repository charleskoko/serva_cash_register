import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_card.dart';

class ArticleList extends StatelessWidget {
  final List<Article> products;
  const ArticleList({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, index) {
            return ArticleCard(product: products[index]);
          }),
    );
  }
}
