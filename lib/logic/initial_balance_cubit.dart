import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/initial_balance.dart';
import 'package:serva_cash_register/data/repositories/initial_balance_repository.dart';

part 'initial_balance_state.dart';

class InitialBalanceCubit extends Cubit<InitialBalanceState> {
  InitialBalanceCubit() : super(InitialBalanceInitial());
  InitialBalanceRepository _initialBalanceRepository =
      InitialBalanceRepository();

  setCashFund(String cashFund) async {
    emit(InitialBalanceInitialisation());
    var data;
    if (cashFund?.isEmpty ?? true) {
      data = {'value': 0.toDouble()};
    } else {
      data = {'value': double.parse(cashFund)};
    }
    final InitialBalance initialBalance =
        await _initialBalanceRepository.saveInitialBalance(data);
    emit(InitialBalanceSaved(initialBalance));
  }
}
