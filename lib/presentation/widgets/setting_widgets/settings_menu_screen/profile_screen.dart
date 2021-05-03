import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/logic/settings_cubit.dart';

class ProfileScreen extends StatelessWidget {
  final SettingsProfile user;
  ProfileScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              child: Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        'Prenoms',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'SourceSansPro'),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color(0xffFBFDFF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffD5E6FD))),
                        child: Text(
                          user.user.firstName,
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'SourceSansPro'),
                        ))
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        'Nom',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'SourceSansPro'),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Color(0xffFBFDFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xffD5E6FD))),
                      child: Text(
                        user.user.lastName,
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'SourceSansPro'),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 530,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'SourceSansPro'),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 530,
                      decoration: BoxDecoration(
                          color: Color(0xffFBFDFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xffD5E6FD))),
                      child: Text(
                        user.user.email,
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'SourceSansPro'),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 530,
                      child: Text(
                        'Mobile',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'SourceSansPro'),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: 530,
                      decoration: BoxDecoration(
                          color: Color(0xffFBFDFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xffD5E6FD))),
                      child: Text(
                        (user.user.mobile != null) ? user.user.mobile : '',
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'SourceSansPro'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
