import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/data/repositories/product_repositories.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final ProductRepository _productRepository = ProductRepository();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashRegisterCubit>(
      create: (context) => CashRegisterCubit(_productRepository),
      child: MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: Colors.grey.shade200),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
