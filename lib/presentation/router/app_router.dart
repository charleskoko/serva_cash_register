import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serva_cash_register/presentation/screens/home_screen.dart';
import 'package:serva_cash_register/presentation/screens/cash_register_screen.dart';
import 'package:serva_cash_register/presentation/screens/payment_completed_screen.dart';
import 'package:serva_cash_register/presentation/screens/payment_method_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case '/register':
        return MaterialPageRoute(builder: (_) => CashRegisterScreen());
        break;
      case '/paymentMethod':
        return MaterialPageRoute(builder: (_) => PaymentMethodScreen());
        break;
      case '/paymentCompleted':
        return MaterialPageRoute(builder: (_) => PaymentCompletedScreen());
        break;
      default:
        return null;
    }
  }
}
