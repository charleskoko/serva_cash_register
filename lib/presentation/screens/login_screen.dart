import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/login_cubit.dart';
import 'package:serva_cash_register/logic/text_field_error_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/login_screen/login_error_pop_up.dart';
import 'package:serva_cash_register/presentation/widgets/login_screen/not_team_error_pop_up.dart';

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
                        child: LoginErrorPopUp(),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {});
            }
            if (state is LoginInitial) {
              // rien pour le moment.
            }
            if (state is LoggedIn) {
              BlocProvider.of<AuthCubit>(context).userAuthenticated();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            }
            if (state is NotTeamMember) {
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
                        child: NotTeamErrorPopUp(),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {});
              ;
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/serva_logo.png"))),
                        width: 160,
                        height: 160,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 450,
                        child: Column(
                          children: [
                            Theme(
                              data: ThemeData(primaryColor: Color(0xff973be8)),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: mailController,
                                decoration: InputDecoration(labelText: 'Email'),
                              ),
                            ),
                            BlocBuilder<TextFieldErrorCubit,
                                TextFieldErrorState>(
                              builder: (context, state) {
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    (state.hasError == true)
                                        ? 'Vous devez remplir ce champs'
                                        : (state.isNotEmail == true)
                                            ? 'Veuillez entrez une adresse email valide'
                                            : '',
                                    style: TextStyle(
                                        color: (state.hasError == true ||
                                                state.isNotEmail == true)
                                            ? Colors.red
                                            : Colors.white),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            Theme(
                              data: ThemeData(primaryColor: Color(0xff973be8)),
                              child: TextField(
                                controller: passwordController,
                                decoration:
                                    InputDecoration(labelText: 'Mot de passe'),
                                obscureText: true,
                              ),
                            ),
                            BlocBuilder<TextFieldErrorCubit,
                                TextFieldErrorState>(
                              builder: (context, state) {
                                return Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Vous devez remplir ce champs',
                                      style: TextStyle(
                                          color: (state.hasError == true)
                                              ? Colors.red
                                              : Colors.white),
                                    ));
                              },
                            ),
                            SizedBox(height: 50),
                            Center(
                              child: TextButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Se connecter',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Color(0xff973be8),
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  if (mailController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    BlocProvider.of<TextFieldErrorCubit>(
                                            context)
                                        .error();
                                  } else {
                                    bool emailValidation =
                                        Utility.validateEmail(
                                            mailController.text);
                                    if (emailValidation == true) {
                                      BlocProvider.of<TextFieldErrorCubit>(
                                              context)
                                          .noError();
                                      var credential = {
                                        'email': mailController.text,
                                        'password': passwordController.text
                                      };
                                      BlocProvider.of<LoginCubit>(context)
                                          .login(credential);
                                    } else {
                                      BlocProvider.of<TextFieldErrorCubit>(
                                              context)
                                          .emailVerification();
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
