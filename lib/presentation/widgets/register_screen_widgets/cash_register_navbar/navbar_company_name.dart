import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/login_cubit.dart';

class NavbarCompanyName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoggedIn) {
            return Text(
              state.user.company.label.toUpperCase(),
              style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
            );
          } else {
            return Text('');
          }
        },
      ),
    );
  }
}
