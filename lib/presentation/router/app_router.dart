import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/presentation/screens/home_screen.dart';
import 'package:serva_cash_register/presentation/screens/register_screen.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case'/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case'/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        break;
      default:
        return null;
    }
  }
}