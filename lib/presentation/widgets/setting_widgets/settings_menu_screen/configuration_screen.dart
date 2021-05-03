import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/logic/company_cubit.dart';
import 'package:serva_cash_register/logic/utility.dart';

class ConfigurationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: BlocProvider.of<CompanyCubit>(context),
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Mes Entreprises Enregistrées',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.brightness_1,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width / 5,
                                child: Text(
                                  'Label'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width / 5,
                                child: Text(
                                  'Contacts'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  'Situation Geographique'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                        (state is CompanyLoaded)
                            ? Container(
                                child: (state.companies.length == 0)
                                    ? Container(
                                        child: Text(
                                            'Enregistré Votre premiere entreprise'),
                                      )
                                    : Container(
                                        child: ListView.builder(
                                            itemCount: state.companies.length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final Company company =
                                                  state.companies[index];

                                              return InkWell(
                                                onTap: () {
                                                  BlocProvider.of<CompanyCubit>(
                                                          context)
                                                      .selectCompany(
                                                          company, state);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Color(0xffD5E6FD)),
                                                  )),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Icon(
                                                          Icons.brightness_1,
                                                          color: (Utility
                                                                  .selectedCompany(
                                                                      company,
                                                                      state
                                                                          .selectedCompany)
                                                              ? Colors.green
                                                              : Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Text(
                                                          company.label,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Text(
                                                          company.phone,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3,
                                                        child: Text(
                                                          company.address,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SourceSansPro',
                                                              fontSize: 20),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                              )
                            : Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
