import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrossTotalCard extends StatelessWidget {
  final double total;

  const GrossTotalCard({Key key, this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'Total',
            style: TextStyle(fontSize: 30, fontFamily: 'SourceSansPro'),
          ),
          SizedBox(height: 15),
          Text(
            total.toStringAsFixed(2) + ' XOF',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'SourceSansPro',
            ),
          )
        ],
      ),
    );
  }
}
