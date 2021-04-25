import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serva_cash_register/logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<LoginCubit>(context),
          listener: (context, state) {
            if (state is LoginError) {
              showGeneralDialog(
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) {
                    final curvedValue =
                        Curves.easeInOutBack.transform(a1.value) - 1.0;
                    return Transform(
                      transform: Matrix4.translationValues(
                          0.0, curvedValue * 200, 0.0),
                      child: Opacity(
                        opacity: a1.value,
                        child: AlertDialog(
                          title: Text(
                            'Attention',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          content: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              state.message,
                              style: TextStyle(
                                  fontFamily: 'SourceSanPro', fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {});
            }
            if (state is LoginInitial) {
              // rien pour le moment.
            }
            if (state is LoggedIn) {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            }
          },
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Serva Cash Register',
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Inspired by You for You',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro', letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 450,
                    child: Column(
                      children: [
                        Theme(
                          data: ThemeData(primaryColor: Colors.black),
                          child: TextField(
                            controller: mailController,
                            decoration: InputDecoration(labelText: 'Email'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Theme(
                          data: ThemeData(primaryColor: Colors.black),
                          child: TextField(
                            controller: passwordController,
                            decoration:
                                InputDecoration(labelText: 'Mot de passe'),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 50),
                        TextButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'connexion'.toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            var credential = {
                              'email': mailController.text,
                              'password': passwordController.text
                            };
                            BlocProvider.of<LoginCubit>(context)
                                .login(credential);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
