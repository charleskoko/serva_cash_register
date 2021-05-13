import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serva_cash_register/logic/home_cubit.dart';
import 'package:serva_cash_register/logic/initial_balance_cubit.dart';
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
    return BlocConsumer<InitialBalanceCubit, InitialBalanceState>(
      listener: (context, state) {
        if (state is InitialBalanceSaved) {
          Navigator.of(context).popUntil((route) => false);
          Navigator.of(context).pushNamed('/register');
        }
      },
      builder: (context, state) {
        return Transform(
          transform:
              Matrix4.translationValues(0.0, widget.curvedValue * 200, 0.0),
          child: Opacity(
            opacity: widget.a1.value,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: Container(
                width: 500,
                height: 415,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      child: Text(
                        'solde initial'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25, fontFamily: 'SourceSansPro'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        (cashFund == null) ? 0.toString() : cashFund,
                        style: TextStyle(
                            fontFamily: 'SourceSansPro', fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
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
                          BlocBuilder<InitialBalanceCubit, InitialBalanceState>(
                              builder: (context, state) {
                            if (state is InitialBalanceInitial) {
                              return TextButton(
                                onPressed: () {
                                  BlocProvider.of<InitialBalanceCubit>(context)
                                      .setCashFund(cashFund);
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,
                                  onSurface: Colors.grey,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 150,
                                  height: 60,
                                  child: Text(
                                    'Valider'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'SourceSansPro',
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,
                                  onSurface: Colors.grey,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  width: 150,
                                  child: SpinKitCircle(color: Colors.black),
                                ),
                              );
                            }
                          })
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
