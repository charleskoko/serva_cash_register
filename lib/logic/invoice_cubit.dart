import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/invoice.dart';
import 'package:serva_cash_register/data/repositories/invoice_repository.dart';

part 'states/invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepository _invoiceRepository;
  InvoiceCubit(this._invoiceRepository) : super(InvoiceInitial());

  void getAllInvoiceCurrentInitialBalance() async {
    emit(InvoiceLoading());
    final List<Invoice> invoices = await _invoiceRepository.getInvoice();
    emit(InvoiceLoaded(invoices));
  }

  void cancelInvoice(Invoice invoice) async {
    emit(InvoiceLoading());
    await _invoiceRepository.cancelInvoice(invoice);
    emit(InvoiceCanceled());
    final List<Invoice> invoices = await _invoiceRepository.getInvoice();
    emit(InvoiceLoaded(invoices));
  }

  void invoiceFilter(String text) async {
    emit(InvoiceLoading());
    List<Invoice> filteredArticles;
    List<Invoice> invoices = await _invoiceRepository.getInvoice();
    if (text.isNotEmpty) {
      filteredArticles = invoices
          .where((element) => (element.number
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase())))
          .toList();
      emit(InvoiceLoaded(filteredArticles));
    } else {
      emit(InvoiceLoaded(invoices));
    }
  }
}
