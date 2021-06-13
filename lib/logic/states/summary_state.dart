part of '../summary_cubit.dart';

@immutable
abstract class SummaryState {}

class SummaryLoaded extends SummaryState {
  final Service service;
  SummaryLoaded({@required this.service});
}

class SummaryLoading extends SummaryState {}

class SummaryClosed extends SummaryState {}

class SummaryError extends SummaryState {
  final bool isServiceCloseError;
  SummaryError({@required this.isServiceCloseError});
}
