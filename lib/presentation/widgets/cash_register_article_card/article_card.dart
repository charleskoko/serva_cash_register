import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/data/models/product.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_image.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_info.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_resume.dart';

import 'article_no_image.dart';

class ArticleCard extends StatelessWidget {
  final Product product;

  const ArticleCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListingCubit, ListingState>(builder: (context, state) {
      return InkWell(
          onTap: () {
            BlocProvider.of<ListingCubit>(context).addArticleToListing(
              product,
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: 4, right: 4, bottom: 4),
            width: 250,
            height: 250,
            color: (Utility.selectedArticle(product, state.listing) == 0)
                ? Colors.white
                : Colors.blue,
            child: Column(
              children: [
                ArticleResume(
                  articleSum: Utility.selectedArticle(product, state.listing),
                ),
                (product.imageUrl != null)
                    ? ArticleImage()
                    : ArticleNoImage(),
                ArticleInfo(
                  product: product,
                )
              ],
            ),
          ));
    });
  }
}
