import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: BlocProvider.of<AuthCubit>(context),
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/register', (route) => false);
          }
          if (state is NotAuthenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
        builder: (context, state) {
          return Center(
            child: SpinKitFadingCircle(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
