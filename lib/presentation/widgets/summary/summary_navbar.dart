import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serva_cash_register/core/abstract/const.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/summary_cubit.dart';

import '../confirm_close_service.dart';

class SummaryNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Container(),
          ),
          Expanded(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Container(
                  child: TextButton(
                    onPressed: () {
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
                                child: ConfirmCloseService(
                                    'Vous etes sur le point de cloturer votre '
                                    'service. Etes-vous sure de vouloir '
                                    'effectuer cette action? Si oui, '
                                    'veuillez entrer votre mot de passe '
                                    'puis confirmer.'),
                              ),
                            );
                          },
                          transitionDuration: Duration(milliseconds: 500),
                          barrierDismissible: true,
                          barrierLabel: '',
                          context: context,
                          pageBuilder: (context, animation1, animation2) {});
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: (state is Authenticated)
                          ? (state.user.role == Constant.USER_OWNER)
                              ? Color(0xff973be8)
                              : Colors.deepPurple.shade200
                          : Color(0xff973be8),
                      onSurface: Colors.grey,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Cloturer son service',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                          color: (state is Authenticated)
                              ? (state.user.role == Constant.USER_OWNER)
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
    );
  }
}
