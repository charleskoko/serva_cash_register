part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsProfile extends SettingsState {
  final User user;
  SettingsProfile(this.user);
}

class SettingsTeam extends SettingsState {}

class SettingsArticles extends SettingsState {}

class SettingsPeripherique extends SettingsState {}

class SettingsCustomer extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsConfiguration extends SettingsState {}
