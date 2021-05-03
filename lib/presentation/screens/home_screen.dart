import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/home_cubit.dart';
import 'package:serva_cash_register/logic/initial_balance_cubit.dart';
import 'package:serva_cash_register/presentation/widgets/cash_fund_pop_up.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: BlocProvider.of<HomeCubit>(context),
        listener: (context, state) {
          if (state is HomeInitialBalanceSelected) {
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                transitionBuilder: (context, a1, a2, widget) {
                  final curvedValue =
                      Curves.easeInOutBack.transform(a1.value) - 1.0;
                  return Transform(
                    transform:
                        Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                    child: Opacity(
                      opacity: a1.value,
                      child: CashFundPopUp(curvedValue, a1),
                    ),
                  );
                },
                transitionDuration: Duration(milliseconds: 500),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                pageBuilder: (context, animation1, animation2) {});
          }
          if (state is HomeSettingSelected) {
            BlocProvider.of<HomeCubit>(context).home();
            Navigator.of(context).pushNamed('/settings');
          }
        },
        builder: (context, state) {
          if (state is HomeLoaded ||
              state is HomeCashRegisterSelected ||
              state is HomeSettingSelected ||
              state is HomeInitialBalanceSelected) {
            return SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Serva Cash Register',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'pacifico',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      state.user.firstName +
                                          ' ' +
                                          state.user.lastName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SourceSansPro',
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Column(
                          children: [
                            Card(
                              elevation: 10,
                              child: Container(
                                color: Colors.blueAccent,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Bienvenue ' + state.user.firstName + ' !',
                                    style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    elevation: 10,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.lightBlueAccent,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {
                                        //print('paramettre pour les admins');
                                        BlocProvider.of<HomeCubit>(context)
                                            .settings();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 150,
                                        height: 150,
                                        child: Icon(
                                          FontAwesomeIcons.cogs,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  BlocBuilder<InitialBalanceCubit, InitialBalanceState>(
                                    builder: (context, state) {
                                      if (state is InitialBalanceSaved) {
                                        return Card(
                                          elevation: 10,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.teal,
                                              onSurface: Colors.grey,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed('/register');
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 150,
                                              height: 150,
                                              child: Icon(
                                                FontAwesomeIcons.cashRegister,
                                                size: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Card(
                                          elevation: 10,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.teal,
                                              onSurface: Colors.grey,
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<HomeCubit>(context)
                                                  .initialBalance();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 150,
                                              height: 150,
                                              child: Icon(
                                                FontAwesomeIcons.cashRegister,
                                                size: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: SpinKitCircle(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
