import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/repositories/setting_repository.dart';

part 'states/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingRepository _settingRepository;
  SettingsCubit(this._settingRepository) : super(SettingsInitial());

  void settingsProfileSelected() async {
    emit(SettingsLoading());
    final User user = await this._settingRepository.getAuthUser();
    emit(SettingsProfile(user));
  }

  void settingsTeamSelected() {
    emit(SettingsLoading());
    emit(SettingsTeam());
  }

  void settingsArticlesSelected() {
    emit(SettingsLoading());
    emit(SettingsArticles());
  }

  void settingsPeripheriqueSelected() {
    emit(SettingsLoading());
    emit(SettingsPeripherique());
  }

  void settingsCustomerSelected() {
    emit(SettingsLoading());
    emit(SettingsCustomer());
  }

  void settingsConfigurationSelected() {
    emit(SettingsLoading());
    emit(SettingsConfiguration());
  }
}
