import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_user_service_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/models/invoice.dart';
import 'package:serva_cash_register/data/models/service.dart';

import 'locator_service.dart';

class InvoiceService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();
  LocalUserServiceProvider _localInitialBalanceProvider =
  LocalUserServiceProvider();

  Future<List<Invoice>> getInvoice() async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();
    final Service service =
        await _localInitialBalanceProvider.readInitialBalance();
    final Map<String, dynamic> response =
        await _httpRequest.get(EndPoint.invoice(company.id, service.id));
    List<dynamic> body = response['data'];
    List<Invoice> invoices =
        body.map((element) => Invoice.fromJson(element)).toList();

    return invoices;
  }

  Future cancelInvoice(Invoice invoice) async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();
    final result = await _httpRequest
        .patch(EndPoint.deletePatchInvoice(company.id, invoice.id));

    return result;
  }
}
