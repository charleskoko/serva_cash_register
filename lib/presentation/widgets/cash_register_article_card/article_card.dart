import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      final quantityController = TextEditingController();
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
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        content: Container(
                          width: 600,
                          height: 250,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade300))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.infoCircle,
                                      size: 20,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Quantité'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'SourceSansPro',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: quantityController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText:
                                            "Entrez la quantité de l'article",
                                        fillColor: Colors.white70),
                                  )),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        'ok',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 20,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue.shade300,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<ListingCubit>(context)
                                            .addArticleToListing(product,
                                                quantity:
                                                    quantityController.text);
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
