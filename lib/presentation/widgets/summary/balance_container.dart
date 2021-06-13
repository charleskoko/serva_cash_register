import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceContainer extends StatelessWidget {
  final double initialAmount;
  final double totalAmount;
  BalanceContainer(this.totalAmount, this.initialAmount);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueAccent,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Solde initial:',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'SourceSansOpen',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            (initialAmount != null) ? '$initialAmount' : '0',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontFamily: 'SourceSansOpen',
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'XOF',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SourceSansOpen',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ventes:',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'SourceSansOpen',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            (totalAmount != null) ? '$totalAmount' : '0',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontFamily: 'SourceSansOpen',
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'XOF',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SourceSansOpen',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Solde total:',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'SourceSansOpen',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            (totalAmount != null && initialAmount != null)
                                ? '${totalAmount + initialAmount}'
                                : '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontFamily: 'SourceSansOpen',
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'XOF',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SourceSansOpen',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
