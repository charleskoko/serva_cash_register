import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/local_article_status.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/services/article_service.dart';

class ArticleRepository {
  ArticleService _articleService = ArticleService();
  ServaHelper _servaHelper = ServaHelper();
  LocalArticleStatus _localArticleStatus = LocalArticleStatus();

  Future<List<Article>> getArticles() async {
    try {
      final List<Article> articles = await _articleService.getArticles();
      return articles;
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    } on UnauthorizedError {
      throw UnauthorizedError();
    }
  }

  Future<void> deleteArticle(Article article) async {
    final result = await _articleService.deleteArticle(article);
  }

  Future<void> updateArticle(Article article, Map<String, dynamic> data) async {
    final result = await _articleService.updateArticle(article, data);
  }

  createArticle(Map<String, String> data) async {
    final result = await _articleService.createArticle(data);
  }

  void saveArticlesLocal(List<Article> articles) {
    for (Article article in articles) {
      _servaHelper.insertArticle(article);
    }
    _localArticleStatus.writeSelectedCompany(isSavedLocal: 'true');
  }
}
