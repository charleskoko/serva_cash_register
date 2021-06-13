import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:serva_cash_register/data/data_provider/local_user_service_provider.dart';
import 'package:serva_cash_register/data/models/service.dart';
import 'package:serva_cash_register/data/repositories/user_service_repository.dart';

part 'states/summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  UserServiceRepository userServiceRepository;
  LocalUserServiceProvider localUserServiceProvider =
      LocalUserServiceProvider();
  SummaryCubit(this.userServiceRepository) : super(SummaryLoading());

  void getServiceInfo() async {
    emit(SummaryLoading());
    final Service savedService =
        await localUserServiceProvider.readInitialBalance();
    final Service service =
        await userServiceRepository.getServiceInfo(savedService.id);
    emit(SummaryLoaded(service: service));
  }

  void endService(String password) async {
    emit(SummaryLoading());
    var data = {'password': password};
    final Service savedService =
        await localUserServiceProvider.readInitialBalance();
    final bool isClosed =
        await userServiceRepository.endService(savedService.id, data);

    if (isClosed == true) {
      localUserServiceProvider.writeInitialBalance('');
      emit(SummaryClosed());
    } else {
      emit(SummaryError(isServiceCloseError: true));
      getServiceInfo();
    }
  }
}
