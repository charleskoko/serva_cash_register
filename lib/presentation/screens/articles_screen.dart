import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/core/abstract/const.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/logic/article_cubit.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';
import 'package:serva_cash_register/logic/text_field_error_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';
import 'package:serva_cash_register/main.dart';
import 'package:serva_cash_register/presentation/widgets/no_service_started.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/cash_payment_content.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/gross_total_card.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/other_payment_content.dart';
import 'package:serva_cash_register/presentation/widgets/payment_method_widgets/payments_tabs_card.dart';
import 'package:serva_cash_register/presentation/widgets/register_screen_widgets/cash_register_navbar/navbar_search_field.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController labelController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<ArticleCubit, ArticleState>(
        listener: (context, state) {
          if (state is ArticleUpdated) {
            final snackBar = SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Article á été modifié avec succès',
                style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is ArticleDeleted) {
            final snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Article á été supprimé avec succès',
                style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is ArticleCreated) {
            final snackBar = SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Article á été Ajouté avec succès',
                style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is ArticleError) {
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
                      child: NoServiceStarted(state.message),
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
          return SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    padding: EdgeInsets.all(12.5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                        right: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 80,
                            child: TextButton(
                              child: Icon(
                                FontAwesomeIcons.arrowCircleLeft,
                                size: 40,
                                color: Colors.grey.shade800,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: NavbarSearchField(),
                        ),
                        Expanded(
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (state is Authenticated) {
                                      User user = state.user;
                                      if (user.role == Constant.USER_EMPLOYEE) {
                                        showGeneralDialog(
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            transitionBuilder:
                                                (context, a1, a2, widget) {
                                              final curvedValue = Curves
                                                      .easeInOutBack
                                                      .transform(a1.value) -
                                                  1.0;
                                              return Transform(
                                                transform:
                                                    Matrix4.translationValues(
                                                        0.0,
                                                        curvedValue * 200,
                                                        0.0),
                                                child: Opacity(
                                                  opacity: a1.value,
                                                  child: AlertDialog(
                                                    title: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .infoCircle,
                                                            size: 40,
                                                            color: Colors
                                                                .red.shade400,
                                                          ),
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(
                                                            'Oups!',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SourceSansPro',
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.0)),
                                                    content: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: EdgeInsets.only(
                                                          left: 55),
                                                      width: 550,
                                                      height: 180,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'Désolé, vous n\'êtes pas administrateur, vous n\'avez pas le droit d\'exécuter cette action.',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                            ),
                                                          ),
                                                          SizedBox(height: 30),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                TextButton(
                                                                  child: Text(
                                                                    '',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'SourceSansPro',
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800),
                                                                  ),
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .green
                                                                        .shade300,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    width: 20),
                                                                TextButton(
                                                                  child: Text(
                                                                    'Bien Compris',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'SourceSansPro',
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .blue,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue
                                                                            .shade100,
                                                                    onSurface:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
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
                                            transitionDuration:
                                                Duration(milliseconds: 500),
                                            barrierDismissible: true,
                                            barrierLabel: '',
                                            context: context,
                                            // ignore: missing_return
                                            pageBuilder: (context, animation1,
                                                animation2) {});
                                      }
                                      if (user.role == Constant.USER_OWNER) {
                                        BlocProvider.of<TextFieldErrorCubit>(
                                                context)
                                            .noError();
                                        showGeneralDialog(
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            transitionBuilder:
                                                (context, a1, a2, widget) {
                                              final curvedValue = Curves
                                                      .easeInOutBack
                                                      .transform(a1.value) -
                                                  1.0;
                                              return Transform(
                                                transform:
                                                    Matrix4.translationValues(
                                                        0.0,
                                                        curvedValue * 200,
                                                        0.0),
                                                child: Opacity(
                                                  opacity: a1.value,
                                                  child: AlertDialog(
                                                    title: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .shoppingBag,
                                                            size: 40,
                                                            color: Colors
                                                                .green.shade400,
                                                          ),
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(
                                                            'Infos de l\'article à ajouter',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SourceSansPro',
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.0)),
                                                    content: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: EdgeInsets.only(
                                                          left: 55, right: 20),
                                                      width: 800,
                                                      height: 180,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        TextField(
                                                                          controller:
                                                                              labelController,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Colors.grey.shade200,
                                                                            hintText:
                                                                                'Entrez le label',
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                5),
                                                                        BlocBuilder<
                                                                            TextFieldErrorCubit,
                                                                            TextFieldErrorState>(
                                                                          builder:
                                                                              (context, state) {
                                                                            return Text(
                                                                              'veuillez remplir ce champs',
                                                                              style: TextStyle(
                                                                                fontFamily: 'SourceSansPro',
                                                                                color: (state.hasError == true) ? Colors.red : Colors.white,
                                                                              ),
                                                                            );
                                                                          },
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 10),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        TextField(
                                                                          controller:
                                                                              priceController,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Colors.grey.shade200,
                                                                            hintText:
                                                                                'Entrez le prix',
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                5),
                                                                        BlocBuilder<
                                                                            TextFieldErrorCubit,
                                                                            TextFieldErrorState>(
                                                                          builder:
                                                                              (context, state) {
                                                                            return Text(
                                                                              'veuillez remplir ce champs',
                                                                              style: TextStyle(
                                                                                fontFamily: 'SourceSansPro',
                                                                                color: (state.hasError == true) ? Colors.red : Colors.white,
                                                                              ),
                                                                            );
                                                                          },
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 30),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                TextButton(
                                                                  child: Text(
                                                                    'Annuler',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'SourceSansPro',
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800),
                                                                  ),
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .green
                                                                        .shade300,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    width: 20),
                                                                TextButton(
                                                                  child: Text(
                                                                    'Enregistrer',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'SourceSansPro',
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .blue,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue
                                                                            .shade100,
                                                                    onSurface:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    if (labelController
                                                                            .text
                                                                            .isNotEmpty &&
                                                                        priceController
                                                                            .text
                                                                            .isNotEmpty) {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      var data =
                                                                          {
                                                                        'label':
                                                                            labelController.text,
                                                                        'price':
                                                                            priceController.text,
                                                                      };
                                                                      BlocProvider.of<ArticleCubit>(
                                                                              context)
                                                                          .createArticle(
                                                                              data);
                                                                    } else {
                                                                      BlocProvider.of<TextFieldErrorCubit>(
                                                                              context)
                                                                          .error();
                                                                    }
                                                                  },
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
                                            transitionDuration:
                                                Duration(milliseconds: 500),
                                            barrierDismissible: true,
                                            barrierLabel: '',
                                            context: context,
                                            // ignore: missing_return
                                            pageBuilder: (context, animation1,
                                                animation2) {});
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: (state is Authenticated)
                                        ? (state.user.role ==
                                                Constant.USER_OWNER)
                                            ? Color(0xff973be8)
                                            : Colors.deepPurple.shade200
                                        : Color(0xff973be8),
                                    onSurface: Colors.grey,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Ajouter un article',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SourceSansPro',
                                        color: (state is Authenticated)
                                            ? (state.user.role ==
                                                    Constant.USER_OWNER)
                                                ? Colors.white
                                                : Colors.grey.shade200
                                            : Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  BlocBuilder<ArticleCubit, ArticleState>(
                    builder: (context, state) {
                      if (state is ArticleLoading) {
                        return Expanded(
                          child: Container(
                            child: Center(
                              child: SpinKitCircle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      } else if (state is ArticleLoaded) {
                        return Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              itemCount: state.articles.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                print(state.articles.length);
                                final article = state.articles[index];
                                return Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 160,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .grey.shade200),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Text(
                                                              article.label
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SourceSansPro',
                                                                fontSize: 25,
                                                                letterSpacing:
                                                                    1,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Text(
                                                              article.number
                                                                  .padLeft(
                                                                      10, '0'),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .deepPurpleAccent
                                                                    .shade200,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'SourceSansPro',
                                                                fontSize: 25,
                                                                letterSpacing:
                                                                    1,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Text(
                                                              '${article.price.toString()} XOF',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SourceSansPro',
                                                                fontSize: 25,
                                                                letterSpacing:
                                                                    1,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 5)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: BlocBuilder<AuthCubit,
                                                  AuthState>(
                                                builder: (context, state) {
                                                  return InkWell(
                                                    onTap: () {
                                                      if (state
                                                          is Authenticated) {
                                                        User user = state.user;
                                                        if (user.role ==
                                                            Constant
                                                                .USER_EMPLOYEE) {
                                                          showGeneralDialog(
                                                              barrierColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5),
                                                              transitionBuilder:
                                                                  (context,
                                                                      a1,
                                                                      a2,
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
                                                                  child:
                                                                      Opacity(
                                                                    opacity: a1
                                                                        .value,
                                                                    child:
                                                                        AlertDialog(
                                                                      title:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              FontAwesomeIcons.infoCircle,
                                                                              size: 40,
                                                                              color: Colors.red.shade400,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 15,
                                                                            ),
                                                                            Text(
                                                                              'Oups!',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 25, fontWeight: FontWeight.bold),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shape: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0)),
                                                                      content:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        padding:
                                                                            EdgeInsets.only(left: 55),
                                                                        width:
                                                                            550,
                                                                        height:
                                                                            180,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Text(
                                                                              'Désolé, vous n\'êtes pas aministrateur, vous n\'avez pas le droit d\'exécuter cette action.',
                                                                              style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontFamily: 'SourceSansPro',
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                            Container(
                                                                              padding: EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  TextButton(
                                                                                    child: Text(
                                                                                      '',
                                                                                      style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                                                                                    ),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.green.shade300,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                  ),
                                                                                  SizedBox(width: 20),
                                                                                  TextButton(
                                                                                    child: Text(
                                                                                      'Bien Compris',
                                                                                      style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontFamily: 'SourceSansPro',
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                    ),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.blue,
                                                                                      backgroundColor: Colors.blue.shade100,
                                                                                      onSurface: Colors.white,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
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
                                                              transitionDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              barrierDismissible:
                                                                  true,
                                                              barrierLabel: '',
                                                              context: context,
                                                              // ignore: missing_return
                                                              pageBuilder: (context,
                                                                  animation1,
                                                                  animation2) {});
                                                        }
                                                        if (user.role ==
                                                            Constant
                                                                .USER_OWNER) {
                                                          showGeneralDialog(
                                                              barrierColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5),
                                                              transitionBuilder:
                                                                  (context,
                                                                      a1,
                                                                      a2,
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
                                                                  child:
                                                                      Opacity(
                                                                    opacity: a1
                                                                        .value,
                                                                    child:
                                                                        AlertDialog(
                                                                      title:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              FontAwesomeIcons.infoCircle,
                                                                              size: 40,
                                                                              color: Colors.red.shade400,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 15,
                                                                            ),
                                                                            Text(
                                                                              'Suppression d\'article',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 25, fontWeight: FontWeight.bold),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shape: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0)),
                                                                      content:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        padding:
                                                                            EdgeInsets.only(left: 55),
                                                                        width:
                                                                            550,
                                                                        height:
                                                                            180,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Text(
                                                                              'Voulez-vous supprimer l\'article? Cette '
                                                                              'action supprimera l\'article de la liste de vos articles',
                                                                              style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontFamily: 'SourceSansPro',
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                            Container(
                                                                              padding: EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  TextButton(
                                                                                    child: Text(
                                                                                      'Annuler',
                                                                                      style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                                                                                    ),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.green.shade300,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                  ),
                                                                                  SizedBox(width: 20),
                                                                                  TextButton(
                                                                                    child: Text(
                                                                                      'Supprimer',
                                                                                      style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontFamily: 'SourceSansPro',
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                    ),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.red,
                                                                                      backgroundColor: Colors.red.shade100,
                                                                                      onSurface: Colors.grey,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                      BlocProvider.of<ArticleCubit>(context).deleteArticle(article);
                                                                                    },
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
                                                              transitionDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              barrierDismissible:
                                                                  true,
                                                              barrierLabel: '',
                                                              context: context,
                                                              // ignore: missing_return
                                                              pageBuilder: (context,
                                                                  animation1,
                                                                  animation2) {});
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 160,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .grey.shade200),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .trashAlt,
                                                              color: (state
                                                                      is Authenticated)
                                                                  ? (state.user
                                                                              .role ==
                                                                          Constant
                                                                              .USER_OWNER)
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .red
                                                                          .shade200
                                                                  : Colors.red,
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              'Supprimer',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  color: (state
                                                                          is Authenticated)
                                                                      ? (state.user.role ==
                                                                              Constant
                                                                                  .USER_OWNER)
                                                                          ? Colors
                                                                              .black
                                                                          : Colors
                                                                              .grey
                                                                              .shade400
                                                                      : Colors
                                                                          .black),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: BlocBuilder<AuthCubit,
                                                  AuthState>(
                                                builder: (context, state) {
                                                  return InkWell(
                                                    onTap: () {
                                                      if (state
                                                          is Authenticated) {
                                                        BlocProvider.of<
                                                                    TextFieldErrorCubit>(
                                                                context)
                                                            .noError();
                                                        showGeneralDialog(
                                                            barrierColor: Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5),
                                                            transitionBuilder:
                                                                (context,
                                                                    a1,
                                                                    a2,
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
                                                                  opacity:
                                                                      a1.value,
                                                                  child:
                                                                      AlertDialog(
                                                                    title:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            FontAwesomeIcons.pen,
                                                                            size:
                                                                                40,
                                                                            color:
                                                                                Colors.green.shade400,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          Text(
                                                                            article.label.toUpperCase(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: TextStyle(
                                                                                fontFamily: 'SourceSansPro',
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shape: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0)),
                                                                    content:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              55,
                                                                          right:
                                                                              20),
                                                                      width:
                                                                          800,
                                                                      height:
                                                                          180,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    child: Column(
                                                                                      children: [
                                                                                        TextField(
                                                                                          controller: labelController,
                                                                                          decoration: InputDecoration(
                                                                                            filled: true,
                                                                                            fillColor: Colors.grey.shade200,
                                                                                            hintText: article.label,
                                                                                            border: InputBorder.none,
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 5),
                                                                                        BlocBuilder<TextFieldErrorCubit, TextFieldErrorState>(
                                                                                          builder: (context, state) {
                                                                                            return Text(
                                                                                              'veuillez remplir ce champs',
                                                                                              style: TextStyle(
                                                                                                fontFamily: 'SourceSansPro',
                                                                                                color: (state.hasError == true) ? Colors.red : Colors.white,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(width: 10),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    child: Column(
                                                                                      children: [
                                                                                        TextField(
                                                                                          controller: priceController,
                                                                                          keyboardType: TextInputType.number,
                                                                                          decoration: InputDecoration(
                                                                                            filled: true,
                                                                                            fillColor: Colors.grey.shade200,
                                                                                            hintText: '${article.price.toString()} XOF',
                                                                                            border: InputBorder.none,
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 5),
                                                                                        BlocBuilder<TextFieldErrorCubit, TextFieldErrorState>(
                                                                                          builder: (context, state) {
                                                                                            return Text(
                                                                                              'veuillez remplir ce champs',
                                                                                              style: TextStyle(
                                                                                                fontFamily: 'SourceSansPro',
                                                                                                color: (state.hasError == true) ? Colors.red : Colors.white,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 30),
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 20, right: 20),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                TextButton(
                                                                                  child: Text(
                                                                                    'Annuler',
                                                                                    style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                                                                                  ),
                                                                                  style: TextButton.styleFrom(
                                                                                    primary: Colors.green.shade300,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                ),
                                                                                SizedBox(width: 20),
                                                                                TextButton(
                                                                                  child: Text(
                                                                                    'Enregistrer',
                                                                                    style: TextStyle(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontFamily: 'SourceSansPro',
                                                                                      fontSize: 20,
                                                                                    ),
                                                                                  ),
                                                                                  style: TextButton.styleFrom(
                                                                                    primary: Colors.blue,
                                                                                    backgroundColor: Colors.blue.shade100,
                                                                                    onSurface: Colors.white,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    if (labelController.text.isNotEmpty || priceController.text.isNotEmpty) {
                                                                                      Navigator.of(context).pop();
                                                                                      var data = {
                                                                                        'label': (labelController.text.isEmpty) ? article.label : labelController.text,
                                                                                        'price': (priceController.text.isEmpty) ? article.price : priceController.text,
                                                                                      };
                                                                                      BlocProvider.of<ArticleCubit>(context).updateArticle(article, data);
                                                                                    } else {
                                                                                      BlocProvider.of<TextFieldErrorCubit>(context).error();
                                                                                    }
                                                                                  },
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
                                                            transitionDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            barrierDismissible:
                                                                true,
                                                            barrierLabel: '',
                                                            context: context,
                                                            // ignore: missing_return
                                                            pageBuilder: (context,
                                                                animation1,
                                                                animation2) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      height: 160,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .grey.shade200),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .pen,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              'Modifier',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'SourceSansPro',
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          child: Text('inconnu'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
