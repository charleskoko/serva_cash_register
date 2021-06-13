import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/initialization_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: BlocProvider.of<InitializationCubit>(context),
        listener: (context, state) {
          if (state is Initialized) {
            BlocProvider.of<AuthCubit>(context).authenticationVerification();
            Navigator.pushNamedAndRemoveUntil(
                context, '/splash2', (route) => false);
          }
          if (state is InitializedFirst) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
          if (state is NotInitialized) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/initialization', (route) => false);
          }
        },
        builder: (context, state) {
          return Center(
            child: Row(
              children: [
                SpinKitFadingCircle(
                  color: Colors.black,
                ),
                Text('splash screen 1')
              ],
            ),
          );
        },
      ),
    );
  }
}
