import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/data/repositories/listing_repository.dart';
import 'package:serva_cash_register/data/repositories/product_repository.dart';
import 'package:serva_cash_register/logic/cash_fund_cubit.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<CashFundCubit>(create: (context) => CashFundCubit()),
          BlocProvider<CashRegisterCubit>(
              create: (context) => CashRegisterCubit(productRepository)),
          BlocProvider<ListingCubit>(
              create: (context) => ListingCubit(listingRepository)),
        ],
        child: MaterialApp(
          theme: new ThemeData(scaffoldBackgroundColor: Colors.grey.shade300),
          onGenerateRoute: appRouter.onGenerateRoute,
        ));
  }
}
