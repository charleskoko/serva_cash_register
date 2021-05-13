import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/repositories/company_repository.dart';
import 'package:serva_cash_register/data/repositories/home_repository.dart';
import 'package:serva_cash_register/data/repositories/listing_repository.dart';
import 'package:serva_cash_register/data/repositories/article_repository.dart';
import 'package:serva_cash_register/data/services/locator_service.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';
import 'package:serva_cash_register/logic/initial_balance_cubit.dart';
import 'package:serva_cash_register/logic/cash_register_cubit.dart';
import 'package:serva_cash_register/logic/company_cubit.dart';
import 'package:serva_cash_register/logic/listing_cubit.dart';
import 'package:serva_cash_register/logic/local_order_item_cubit.dart';
import 'package:serva_cash_register/logic/login_cubit.dart';
import 'package:serva_cash_register/logic/numeric_pad_cubit.dart';
import 'package:serva_cash_register/logic/payment_completed_cubit.dart';
import 'package:serva_cash_register/logic/payment_method_cubit.dart';
import 'package:serva_cash_register/logic/settings_cubit.dart';
import 'package:serva_cash_register/presentation/router/app_router.dart';

import 'data/repositories/auth_repository.dart';
import 'data/repositories/login_repository.dart';
import 'data/repositories/setting_repository.dart';
import 'logic/article_cubit.dart';
import 'logic/home_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(
    MyApp(
      appRouter: AppRouter(),
      listingRepository: ListingRepository(),
      authRepository: AuthRepository(),
      loginRepository: LoginRepository(),
      homeRepository: HomeRepository(),
      companyRepository: CompanyRepository(),
      settingRepository: SettingRepository(),
      articleRepository: ArticleRepository(),
    ),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  final ArticleRepository articleRepository;
  final ListingRepository listingRepository;
  final AuthRepository authRepository;
  final LoginRepository loginRepository;
  final HomeRepository homeRepository;
  final CompanyRepository companyRepository;
  final SettingRepository settingRepository;

  const MyApp({
    Key key,
    @required this.appRouter,
    @required this.articleRepository,
    @required this.companyRepository,
    @required this.authRepository,
    @required this.loginRepository,
    @required this.homeRepository,
    @required this.settingRepository,
    this.listingRepository,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ServaHelper _servaHelper = ServaHelper();

  @override
  void initState() {
    _servaHelper
        .initializeDatabase()
        .then((value) => {print('--- database initialized ---')});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(widget.authRepository),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(widget.loginRepository),
        ),
        BlocProvider<ArticleCubit>(
          create: (context) => ArticleCubit(widget.articleRepository),
        ),
        BlocProvider<CompanyCubit>(
          create: (context) => CompanyCubit(widget.companyRepository),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(widget.homeRepository),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(widget.settingRepository),
        ),
        BlocProvider<InitialBalanceCubit>(
          create: (context) => InitialBalanceCubit(),
        ),
        BlocProvider<CashRegisterCubit>(
          create: (context) => CashRegisterCubit(widget.articleRepository),
        ),
        BlocProvider<ListingCubit>(
          create: (context) => ListingCubit(widget.listingRepository),
        ),
        BlocProvider<PaymentMethodCubit>(
          create: (context) => PaymentMethodCubit(),
        ),
        BlocProvider<LocalOrderItemCubit>(
          create: (context) => LocalOrderItemCubit(),
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
        onGenerateRoute: widget.appRouter.onGenerateRoute,
      ),
    );
  }
}
