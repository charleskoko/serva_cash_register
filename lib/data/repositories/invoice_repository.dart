import 'package:serva_cash_register/data/models/invoice.dart';
import 'package:serva_cash_register/data/services/invoice_service.dart';

class InvoiceRepository {
  InvoiceService _invoiceService = InvoiceService();

  Future<List<Invoice>> getInvoice() async {
    final List<Invoice> invoices = await _invoiceService.getInvoice();
    return invoices;
  }

  Future<void> cancelInvoice(Invoice invoice) async {
    final result = await _invoiceService.cancelInvoice(invoice);
  }
}
