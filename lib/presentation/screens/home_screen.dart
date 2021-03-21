import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/presentation/widgets/cash_fund_pop_up.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context1).size.width,
                height: 60,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Serva Logo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                            letterSpacing: 1.5,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Charles Koko',
                              style: TextStyle(
                                  fontSize: 25,
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
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context1).size.width,
                height: MediaQuery.of(context1).size.height / 1.2,
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        color: Colors.blueAccent,
                        height: 100,
                        child: Center(
                          child: Text(
                            'Bienvenue Charles !',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                              fontSize: 60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context1).size.width,
                      height: MediaQuery.of(context1).size.height / 1.5,
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
                                print('paramettre pour les admins');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                                child: Icon(
                                  FontAwesomeIcons.cogs,
                                  size: 90,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Card(
                            elevation: 10,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.teal,
                                onSurface: Colors.grey,
                              ),
                              onPressed: () {
                                showGeneralDialog(
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    transitionBuilder:
                                        (context, a1, a2, widget) {
                                      final curvedValue = Curves.easeInOutBack
                                              .transform(a1.value) -
                                          1.0;
                                      return CashFundPopUp(curvedValue, a1);
                                    },
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                    barrierDismissible: true,
                                    barrierLabel: '',
                                    context: context1,
                                    pageBuilder:
                                        (context, animation1, animation2) {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                                child: Icon(
                                  FontAwesomeIcons.cashRegister,
                                  size: 80,
                                ),
                              ),
                            ),
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
  }
}
