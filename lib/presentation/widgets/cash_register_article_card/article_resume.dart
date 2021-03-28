import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleResume extends StatelessWidget {
  final List<Map<String, dynamic>> listing;

  ArticleResume({this.listing});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 4),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'x',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'SourceSansPro',
                color: Colors.white),
          ),
          Text(
          '0',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 30,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
