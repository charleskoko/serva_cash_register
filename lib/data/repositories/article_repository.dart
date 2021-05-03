import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/services/article_service.dart';

class ArticleRepository {
  ArticleService _articleService = ArticleService();

  Future<List<Article>> getArticles() async {
    final List<Article> articles = await _articleService.getArticles();
    return articles;
  }
}
