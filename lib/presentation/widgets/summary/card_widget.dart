import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String logo;
  final int backgroundColor;
  final double amount;
  final int totalSales;
  final double percent;
  CardWidget(
      {this.amount,
      this.logo,
      this.percent,
      this.totalSales,
      this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (backgroundColor == null)
            ? Colors.grey.shade200
            : Color(backgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 250,
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                logo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro',
                    fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Text(
                        '$amount',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro', fontSize: 40),
                      )),
                  Expanded(
                      child: Text(
                    'XOF',
                    style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                child: Row(
                                  children: [

                                    Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text(totalSales.toString(),
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 25)))
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text('$percent',
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 25)),
                                    )),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(' %',
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 20)),
                                    )),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
