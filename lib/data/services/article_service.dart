import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';

import 'locator_service.dart';

class ArticleService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();

  Future<List<Article>> getArticles() async {
    try {
      final Company company =
          await _localSelectedCompanyProvider.readSelectedCompany();
      final Map<String, dynamic> response =
          await _httpRequest.get(EndPoint.article(company.id));
      List<dynamic> body = response['data'];
      List<Article> articles =
          body.map((element) => Article.fromJson(element)).toList();

      return articles;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }

  Future deleteArticle(Article article) async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();
    final result = await _httpRequest
        .delete(EndPoint.deletePatchArticle(company.id, article.id));
  }

  Future updateArticle(Article article, Map<String, dynamic> data) async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();
    final result = await _httpRequest
        .patch(EndPoint.deletePatchArticle(company.id, article.id), data: data);
  }

  createArticle(Map<String, String> data) async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();
    final result =
        await _httpRequest.post(EndPoint.article(company.id), data: data);
  }
}
