import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/cash_fund_cubit.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/presentation/widgets/numeric_pad_button.dart';

class CashFundPopUp extends StatefulWidget {
  final double curvedValue;
  final Animation<double> a1;

  CashFundPopUp(this.curvedValue, this.a1);

  @override
  _CashFundPopUpState createState() => _CashFundPopUpState();
}

class _CashFundPopUpState extends State<CashFundPopUp> {
  String cashFund;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0.0, widget.curvedValue * 200, 0.0),
      child: Opacity(
        opacity: widget.a1.value,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Container(
            width: 800,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Text('                   '
                                    '')),
                            InkWell(
                              child: Text(
                                'Fond de caisse',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('passer à la caisse avec fond de caisse = 0');
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Passer',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // a reconstruire pour afficher le fond de caisse
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child:
                            Text((cashFund == null) ? 0.toString() : cashFund,
                                style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'SourceSansPro',
                                ),
                                overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(height: 10),

                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: Column(
                          children: [
                            // a faire disparaitre
                            Container(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '7';
                                            });
                                          } else {
                                            cashFund = cashFund + '7';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(7, keyHeight: 100, keyWidth: 150,)),
                                  // a faire disparaitre

                                  SizedBox(
                                    width: 10,
                                  ),
                                  // a faire disparaitre

                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '8';
                                            });
                                          } else {
                                            cashFund = cashFund + '8';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(8, keyHeight: 100, keyWidth: 150,)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '9';
                                            });
                                          } else {
                                            cashFund = cashFund + '9';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(9, keyHeight: 100, keyWidth: 150,)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            // a faire disparaitre
                            Container(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '4';
                                            });
                                          } else {
                                            cashFund = cashFund + '4';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(4, keyHeight: 100, keyWidth: 150,)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '5';
                                            });
                                          } else {
                                            cashFund = cashFund + '5';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(5, keyHeight: 100, keyWidth: 150,)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '6';
                                            });
                                          } else {
                                            cashFund = cashFund + '6';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(6, keyHeight: 100, keyWidth: 150,)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            // a faire disparaitre
                            Container(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '1';
                                            });
                                          } else {
                                            cashFund = cashFund + '1';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(1, keyHeight: 100, keyWidth: 150,)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '2';
                                            });
                                          } else {
                                            cashFund = cashFund + '2';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(2, keyHeight: 100, keyWidth: 150,)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '3';
                                            });
                                          } else {
                                            cashFund = cashFund + '3';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(3, keyHeight: 100, keyWidth: 150,)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            //  faire dispariatre
                            Container(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          cashFund = null;
                                        });
                                      },
                                      child: NumericPadKey('c', keyHeight: 100, keyWidth: 150,)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cashFund == null) {
                                            setState(() {
                                              cashFund = '0';
                                            });
                                          } else {
                                            cashFund = cashFund + '0';
                                          }
                                        });
                                      },
                                      child: NumericPadKey(0, keyHeight: 100, keyWidth: 150)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        if (cashFund != null) {
                                          setState(() {
                                            setState(() {
                                              cashFund = cashFund.substring(
                                                  0, cashFund.length - 1);
                                            });
                                          });
                                        }
                                      },
                                      child: NumericPadKey('delete',keyHeight: 100, keyWidth: 150,)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<CashFundCubit, CashFundState>(
                                builder: (context, state) {
                              if (state is CashFundInitial) {
                                return TextButton(
                                  onPressed: () {
                                    BlocProvider.of<CashFundCubit>(context)
                                        .setCashFund(cashFund);
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    onSurface: Colors.grey,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'Valider',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'SourceSansPro',
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                );
                              } else {
                                return TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    BlocProvider.of<CashRegisterCubit>(context)
                                        .getArticle();
                                    Navigator.of(context)
                                        .pushNamed('/register');
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    onSurface: Colors.grey,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'Continuer à la caisse',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'SourceSansPro',
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                );
                              }
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
