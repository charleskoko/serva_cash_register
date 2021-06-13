import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/models/service.dart';
import 'package:serva_cash_register/data/repositories/user_service_repository.dart';

part 'states/initial_balance_state.dart';

class InitialBalanceCubit extends Cubit<InitialBalanceState> {
  InitialBalanceCubit() : super(InitialBalanceInitial());
  UserServiceRepository _initialBalanceRepository = UserServiceRepository();

  setCashFund(String cashFund) async {
    emit(InitialBalanceInitialisation());
    try {
      var data;
      if (cashFund?.isEmpty ?? true) {
        data = {'initial_balance': 0.toDouble()};
      } else {
        data = {'initial_balance': double.parse(cashFund)};
      }
      final Service initialBalance =
          await _initialBalanceRepository.saveInitialBalance(data);
      emit(InitialBalanceSaved(initialBalance));
    } on UnauthorizedError {
      emit(InitialBalanceError(
          'Une erreur est survenue. Veuillez réessayer une nouvelle fois. En cas d\'échec a nouveau, reconnectez-vous.'));
    } on NoServerConnectionError {
      emit(InitialBalanceError(
          'Nous avons rencontrer un probleme lors de la connection au serveur,'
          'veuillez s\'il vous plait verifier votre connection internet et'
          ' essayer de nouveau'));
    }
  }

  noInitialBalance(){
    emit(InitialBalanceInitial());
  }
}
