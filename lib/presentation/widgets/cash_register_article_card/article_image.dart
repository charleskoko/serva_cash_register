import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://via.placeholder.com/150'),
            fit: BoxFit.cover),
      ),
    );
  }
}
