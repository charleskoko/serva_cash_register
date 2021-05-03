import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serva_cash_register/logic/article_cubit.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<ArticleCubit>(context),
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: (state is ArticleLoaded)
              ? Container(
                  child: Text(state.articles.length.toString()),
                )
              : (state is ArticleLoading)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: SpinKitCircle(
                        color: Colors.black,
                      ),),
                    )
                  : Container(
                      child: Text('autre'),
                    ),
        );
      },
    );
  }
}
