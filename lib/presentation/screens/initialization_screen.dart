import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/initialization_cubit.dart';
import 'package:serva_cash_register/logic/text_field_error_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/presentation/widgets/login_screen/Initialization_error_pop_up.dart';
import 'package:serva_cash_register/presentation/widgets/login_screen/login_error_pop_up.dart';

class InitializationScreen extends StatelessWidget {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<InitializationCubit>(context),
          listener: (context, state) {
            if (state is InitializedFirst) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            }
            if (state is InitializedUnknownAccount) {
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
                        child: InitializationErrorPopUp(
                          text:
                              'Les identifiantes entrées n\'ont aucune correspondance '
                              'dans notre base de données ou alors votre '
                              'compte n\'est pas un compte proprietaire '
                              'veuillez reesayé avec les bons identifiants.',
                          title: 'Identifiants incorrects',
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {});
            }
            if (state is InitializedFailedInternet) {
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
                        child: InitializationErrorPopUp(
                          text:
                              'Apparement vous n\'etes pas connecté '
                                  'a internet. veuillez verifier votre'
                                  ' connection internet S\'il vous plait.',
                          title: 'Probleme d\'internet',
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {});
            }
          },
          builder: (context, state) {
            if (state is InitializationInitial || state is NotInitialized) {
              return Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFFFBF3),
                          border:
                              Border.all(width: 2, color: Color(0xffFEDA93))),
                      padding: EdgeInsets.only(left: 5),
                      width: 550,
                      height: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info,
                            size: 40,
                          ),
                          SizedBox(width: 10),
                          Container(
                            alignment: Alignment.center,
                            width: 450,
                            child: Text(
                              'Vous devez avoir un compte, "Proprietaire" '
                              'pour effectuer cette action.'
                              ' Cette Action permet l\'activation votre materiel.',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'SourceSansPro'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            // decoration: BoxDecoration(
                            // image: DecorationImage(
                            // image: AssetImage("images/serva_logo.png")
                            // )
                            //),
                            //width: 150,
                            //height: 150,
                            //),
                            Container(
                              width: 450,
                              child: Column(
                                children: [
                                  Theme(
                                    data: ThemeData(
                                        primaryColor: Color(0xff973be8)),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: mailController,
                                      decoration:
                                          InputDecoration(labelText: 'Email'),
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
                                  SizedBox(height: 5),
                                  Theme(
                                    data: ThemeData(
                                        primaryColor: Color(0xff973be8)),
                                    child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          labelText: 'Mot de passe'),
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
                                  SizedBox(height: 20),
                                  TextButton(
                                    child: Text(
                                      'Enregistrer la tablette',
                                      style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
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
                                        bool emailValid = Utility.validateEmail(
                                            mailController.text);
                                        if (emailValid == true) {
                                          BlocProvider.of<TextFieldErrorCubit>(
                                                  context)
                                              .noError();
                                          var credential = {
                                            'email': mailController.text,
                                            'password': passwordController.text
                                          };
                                          BlocProvider.of<TextFieldErrorCubit>(
                                                  context)
                                              .noError();
                                          BlocProvider.of<InitializationCubit>(
                                                  context)
                                              .initialize(credential);
                                        } else {
                                          BlocProvider.of<TextFieldErrorCubit>(
                                                  context)
                                              .emailVerification();
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is InitializationLoaded) {
              return Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Selectionner, l\'entreprise ou sera utilisé la tablette',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: state.companies.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        BlocProvider.of<InitializationCubit>(
                                                context)
                                            .companySelected(
                                                state.companies[index],
                                                state.companies);
                                      },
                                      child: Container(
                                        color: (Utility.selectedCompany(
                                                state.companies[index],
                                                state.selectedCompany))
                                            ? Colors.grey
                                            : Colors.white,
                                        child: Card(
                                          child: Container(
                                            color: Colors.grey.shade100,
                                            height: 150,
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.4,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 5),
                                                          child: Text(
                                                            state
                                                                .companies[
                                                                    index]
                                                                .label
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'SourceSansPro',
                                                                fontSize: 25),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 5),
                                                          child: Text(
                                                            state
                                                                .companies[
                                                                    index]
                                                                .address,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'SourceSansPro'),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5,
                                                                  bottom: 5),
                                                          child: Text(
                                                              state
                                                                  .companies[
                                                                      index]
                                                                  .phone,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Terminer',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'SourceSansPro'),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Color(0xff973be8),
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  BlocProvider.of<InitializationCubit>(context)
                                      .saveCompany(state.selectedCompany);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitCircle(
                        color: Colors.black,
                      ),
                      SizedBox(height: 20),
                      Text('initialisation en cours...')
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
