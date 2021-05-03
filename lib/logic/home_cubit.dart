import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(HomeInitial()) {
    home();
  }

  void home() async {
    final User user = await _homeRepository.getAuthUSer();
    emit(HomeLoaded(user));
  }

  void settings() async {
    final User user = await _homeRepository.getAuthUSer();
    emit(HomeSettingSelected(user));
  }

  void initialBalance() async {
    final User user = await _homeRepository.getAuthUSer();
    emit(HomeInitialBalanceSelected(user));
  }

  void cashRegisterScreen() {
    emit(HomeCashRegisterSelected());
  }
}
