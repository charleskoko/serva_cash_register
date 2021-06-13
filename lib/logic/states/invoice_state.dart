part of '../invoice_cubit.dart';

@immutable
abstract class InvoiceState {}

class InvoiceInitial extends InvoiceState {}

class InvoiceLoaded extends InvoiceState {
  final List<Invoice> invoices;
  InvoiceLoaded(this.invoices);
}

class InvoiceLoading extends InvoiceState {}

class InvoiceCanceled extends InvoiceState {}
