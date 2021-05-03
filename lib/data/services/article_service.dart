import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class ArticleService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  AuthService _authService = AuthService();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();

  Future<List<Article>> getArticles() async {
    final User user = await _authService.getAuthUser();
    final Map<String, dynamic> response =
        await _httpRequest.get(EndPoint.article(user.company.id));
    List<dynamic> body = response['data'];
    List<Article> articles =
        body.map((element) => Article.fromJson(element)).toList();

    return articles;
  }

  Future<void> deleteArticle() {}
  Future<void> updateArticle() {}
}
