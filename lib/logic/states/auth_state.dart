part of '../auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthenticationLoading extends AuthState {}

class NotAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}
