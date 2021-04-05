import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/data/repositories/listing_repository.dart';
import 'package:serva_cash_register/data/repositories/product_repository.dart';
import 'package:serva_cash_register/logic/cash_fund_cubit.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/numeric_pad_cubit.dart';
import 'package:serva_cash_register/logic/payment_completed_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';
import 'package:serva_cash_register/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    productRepository: ProductRepository(),
    listingRepository: ListingRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final ProductRepository productRepository;
  final ListingRepository listingRepository;

  const MyApp(
      {Key key,
      @required this.appRouter,
      @required this.productRepository,
      this.listingRepository})
      : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<CashFundCubit>(
          create: (context) => CashFundCubit(),
        ),
        BlocProvider<CashRegisterCubit>(
          create: (context) => CashRegisterCubit(productRepository),
        ),
        BlocProvider<ListingCubit>(
          create: (context) => ListingCubit(listingRepository),
        ),
        BlocProvider<PaymentMethodCubit>(
          create: (context) => PaymentMethodCubit(),
        ),
        BlocProvider<NumericPadCubit>(
          create: (context) => NumericPadCubit(),
        ),
        BlocProvider<PaymentCompletedCubit>(
          create: (context) => PaymentCompletedCubit(),
        ),
      ],
      child: MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
