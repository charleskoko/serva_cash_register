import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/logic/article_cubit.dart';
import 'package:serva_cash_register/logic/home_cubit.dart';
import 'package:serva_cash_register/logic/initial_balance_cubit.dart';
import 'package:serva_cash_register/logic/initialization_cubit.dart';
import 'package:serva_cash_register/logic/invoice_cubit.dart';
import 'package:serva_cash_register/logic/summary_cubit.dart';
import 'package:serva_cash_register/presentation/widgets/cash_fund_pop_up.dart';
import 'package:serva_cash_register/presentation/widgets/no_service_started.dart';

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
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            BlocBuilder<InitializationCubit,
                                InitializationState>(
                              builder: (context, state) {
                                if (state is Initialized) {
                                  return Expanded(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        ''.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SourceSansPro',
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${state.user.firstName} ${state.user.lastName}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'SourceSansPro',
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.blueAccent,
                              height: 100,
                              child: Center(
                                child: Text(
                                  'Bienvenue ${state.user.firstName}  !',
                                  style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    color: Colors.white,
                                    fontSize: 60,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                var stateInitialBalance = context
                                                    .read<InitialBalanceCubit>()
                                                    .state;

                                                if (stateInitialBalance is InitialBalanceInitialisation ||
                                                    stateInitialBalance
                                                        is InitialBalanceInitial ||
                                                    stateInitialBalance
                                                        is InitialBalanceError) {
                                                  showGeneralDialog(
                                                      barrierColor: Colors.black
                                                          .withOpacity(0.5),
                                                      transitionBuilder:
                                                          (context, a1, a2,
                                                              widget) {
                                                        final curvedValue = Curves
                                                                .easeInOutBack
                                                                .transform(
                                                                    a1.value) -
                                                            1.0;
                                                        return Transform(
                                                          transform: Matrix4
                                                              .translationValues(
                                                                  0.0,
                                                                  curvedValue *
                                                                      200,
                                                                  0.0),
                                                          child: Opacity(
                                                            opacity: a1.value,
                                                            child: NoServiceStarted(
                                                                'Désolé, vous n\'avez pas démarré un service, vous devez démarrer un service avant d\'accéder à la caisse.'),
                                                          ),
                                                        );
                                                      },
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  500),
                                                      barrierDismissible: true,
                                                      barrierLabel: '',
                                                      context: context,
                                                      pageBuilder: (context,
                                                          animation1,
                                                          animation2) {});
                                                }

                                                if (stateInitialBalance
                                                    is InitialBalanceSaved) {
                                                  Navigator.popAndPushNamed(
                                                      context, '/register');
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .cashRegister,
                                                      color: Colors.blue,
                                                      size: 60,
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'Caisse',
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1.5,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                              child: InkWell(
                                            onTap: () {
                                              var articleState = context
                                                  .read<ArticleCubit>()
                                                  .state;
                                              if ((articleState
                                                      is ArticleLoaded) &&
                                                  (articleState
                                                              .isNoServerConnectionError ==
                                                          true ||
                                                      articleState
                                                              .isUnauthorizedError ==
                                                          true)) {
                                                showGeneralDialog(
                                                    barrierColor: Colors.black
                                                        .withOpacity(0.5),
                                                    transitionBuilder: (context,
                                                        a1, a2, widget) {
                                                      final curvedValue = Curves
                                                              .easeInOutBack
                                                              .transform(
                                                                  a1.value) -
                                                          1.0;
                                                      return Transform(
                                                        transform: Matrix4
                                                            .translationValues(
                                                                0.0,
                                                                curvedValue *
                                                                    200,
                                                                0.0),
                                                        child: Opacity(
                                                          opacity: a1.value,
                                                          child: NoServiceStarted(
                                                              'Nous avons rencontrer un probleme lors de la connection au serveur,'
                                                              ' veuillez s\'il vous plait verifier votre connection internet et'
                                                              ' essayer de nouveau'),
                                                        ),
                                                      );
                                                    },
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 500),
                                                    barrierDismissible: true,
                                                    barrierLabel: '',
                                                    context: context,
                                                    pageBuilder: (context,
                                                        animation1,
                                                        animation2) {});
                                              } else {
                                                Navigator.of(context)
                                                    .pushNamed('/articles');
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .shoppingBag,
                                                    color: Color(0xffA66834),
                                                    size: 60,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Articles',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1.5,
                                                      color: Color(0xffA66834),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                    )),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(child: BlocBuilder<
                                                InitialBalanceCubit,
                                                InitialBalanceState>(
                                              builder: (context, state) {
                                                if (state is InitialBalanceInitial ||
                                                    state
                                                        is InitialBalanceInitialisation ||
                                                    state
                                                        is InitialBalanceError) {
                                                  return InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  HomeCubit>(
                                                              context)
                                                          .initialBalance();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .briefcase,
                                                            color:
                                                                Colors.orange,
                                                            size: 80,
                                                          ),
                                                          SizedBox(height: 10),
                                                          Text(
                                                            'Demarrer un service',
                                                            style: TextStyle(
                                                              fontSize: 30,
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing:
                                                                  1.5,
                                                              color:
                                                                  Colors.orange,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  SummaryCubit>(
                                                              context)
                                                          .getServiceInfo();
                                                      Navigator.pushNamed(
                                                          context, '/summary');
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .bed,
                                                            color:
                                                                Colors.orange,
                                                            size: 80,
                                                          ),
                                                          SizedBox(height: 10),
                                                          Text(
                                                            'Terminer son service',
                                                            style: TextStyle(
                                                              fontSize: 30,
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing:
                                                                  1.5,
                                                              color:
                                                                  Colors.orange,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            )),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  var stateInitialBalance = context
                                                      .read<
                                                          InitialBalanceCubit>()
                                                      .state;

                                                  if (stateInitialBalance
                                                          is InitialBalanceInitialisation ||
                                                      stateInitialBalance
                                                          is InitialBalanceInitial) {
                                                    showGeneralDialog(
                                                        barrierColor: Colors
                                                            .black
                                                            .withOpacity(0.5),
                                                        transitionBuilder:
                                                            (context, a1, a2,
                                                                widget) {
                                                          final curvedValue = Curves
                                                                  .easeInOutBack
                                                                  .transform(a1
                                                                      .value) -
                                                              1.0;
                                                          return Transform(
                                                            transform: Matrix4
                                                                .translationValues(
                                                                    0.0,
                                                                    curvedValue *
                                                                        200,
                                                                    0.0),
                                                            child: Opacity(
                                                              opacity: a1.value,
                                                              child: NoServiceStarted(
                                                                  'Désolé, vous n\'avez pas démarré un service, vous devez démarrer un service avant d\'accéder aux reçus.'),
                                                            ),
                                                          );
                                                        },
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        barrierDismissible:
                                                            true,
                                                        barrierLabel: '',
                                                        context: context,
                                                        pageBuilder: (context,
                                                            animation1,
                                                            animation2) {});
                                                  }

                                                  if (stateInitialBalance
                                                      is InitialBalanceSaved) {
                                                    BlocProvider.of<
                                                                InvoiceCubit>(
                                                            context)
                                                        .getAllInvoiceCurrentInitialBalance();
                                                    Navigator.of(context)
                                                        .pushNamed('/invoices');
                                                  } else {}
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .fileInvoice,
                                                        color: Colors.green,
                                                        size: 60,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        'Réçu',
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1.5,
                                                          color: Colors.green,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Text('1.1.0 - beta'),
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
