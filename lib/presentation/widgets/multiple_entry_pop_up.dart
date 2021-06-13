import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/logic/home_cubit.dart';
import 'package:serva_cash_register/logic/initial_balance_cubit.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/presentation/widgets/numeric_pad_button.dart';

class MultipleEntryPopUp extends StatefulWidget {
  final double curvedValue;
  final Animation<double> a1;
  final Article article;

  MultipleEntryPopUp(this.curvedValue, this.a1, this.article);

  @override
  _MultipleEntryPopUpState createState() => _MultipleEntryPopUpState();
}

class _MultipleEntryPopUpState extends State<MultipleEntryPopUp> {
  String cashFund;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CashRegisterCubit, CashRegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Transform(
          transform:
              Matrix4.translationValues(0.0, widget.curvedValue * 200, 0.0),
          child: Opacity(
            opacity: widget.a1.value,
            child: AlertDialog(
              title: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.keyboard,
                      size: 40,
                      color: Colors.green.shade400,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Nouvelle quantité',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: Container(
                width: 500,
                height: 415,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        (cashFund == null) ? 0.toString() : cashFund,
                        style: TextStyle(
                            fontFamily: 'SourceSansPro', fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    child: NumericPadKey(
                                      7,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(
                                      8,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(
                                      9,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    child: NumericPadKey(
                                      4,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(
                                      5,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(
                                      6,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          // a faire disparaitre
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    child: NumericPadKey(
                                      1,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(
                                      2,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(
                                      3,
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          //  faire dispariatre
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        cashFund = null;
                                      });
                                    },
                                    child: NumericPadKey(
                                      'c',
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
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
                                    child: NumericPadKey(0,
                                        keyHeight: 50, keyWidth: 80)),
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
                                    child: NumericPadKey(
                                      'delete',
                                      keyHeight: 50,
                                      keyWidth: 80,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                              onPressed: () {
                                BlocProvider.of<ListingCubit>(context)
                                    .addArticleToListing(widget.article,
                                        quantity: cashFund);
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blue,
                                onSurface: Colors.grey,
                              ),
                              child: Text(
                                'Valider',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ))
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
