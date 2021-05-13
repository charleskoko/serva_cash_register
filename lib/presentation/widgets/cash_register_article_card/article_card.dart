import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_image.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_info.dart';
import 'package:serva_cash_register/presentation/widgets/cash_register_article_card/article_resume.dart';
import 'package:serva_cash_register/presentation/widgets/multiple_entry_pop_up.dart';

import 'article_no_image.dart';

class ArticleCard extends StatelessWidget {
  final Article product;

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
          onLongPress: () {
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                transitionBuilder: (context, a1, a2, widget) {
                  final curvedValue =
                      Curves.easeInOutBack.transform(a1.value) - 1.0;
                  return Transform(
                    transform:
                        Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                    child: Opacity(
                      opacity: a1.value,
                      child: MultipleEntryPopUp(curvedValue,a1,product),
                    ),
                  );
                },
                transitionDuration: Duration(milliseconds: 200),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                // ignore: missing_return
                pageBuilder: (context, animation1, animation2) {});
          },
          //article card
          child: Container(
            color: (Utility.selectedArticle(product, state.listing) == 0)
                ? Colors.white
                : Colors.blue,
            child: Column(
              children: [
                ArticleResume(
                  articleSum: Utility.selectedArticle(product, state.listing),
                ),
                (product.imageUrl != null) ? ArticleImage() : ArticleNoImage(),
                ArticleInfo(
                  product: product,
                )
              ],
            ),
          ));
    });
  }
}
