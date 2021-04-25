
import 'package:get_it/get_it.dart';
import 'package:serva_cash_register/core/abstract/http_request_service.dart';

import 'http_request_api_service.dart';

final getIt = GetIt.instance;

setupServiceLocator(){
  getIt.registerLazySingleton<HttpRequestService>(() => HttpRequestApiService());
}