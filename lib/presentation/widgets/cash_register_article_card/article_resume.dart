import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleResume extends StatelessWidget {
  final int articleSum;

  ArticleResume({this.articleSum});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.only(right: 4),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'x',
            style: TextStyle(
                fontSize: 18, fontFamily: 'SourceSansPro', color: Colors.white),
          ),
          Text(
            articleSum.toString(),
            style: TextStyle(
                fontFamily: 'SourceSansPro', fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
