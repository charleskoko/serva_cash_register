import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/local_article_status.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/repositories/article_repository.dart';
part 'states/article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleRepository articleRepository;
  LocalArticleStatus _localArticleStatus = LocalArticleStatus();
  ArticleCubit(this.articleRepository) : super(ArticleInitial()) {
    getArticles();
  }

  void getArticles() async {
    emit(ArticleLoading());
    try {
      final List<Article> articles = await articleRepository.getArticles();
      print(articles);
      try {
        final String statusOfLocalSavedArticle =
            await _localArticleStatus.readSelectedCompany();

        if (statusOfLocalSavedArticle != 'true') {
          articleRepository.saveArticlesLocal(articles);
        }
        emit(ArticleLoaded(articles));
      } on FileSystemExceptionError {
        emit(ArticleLoaded(articles));
      }
    } on UnauthorizedError {
      emit(ArticleError(
          'Veuillez vous reconnecter, apparemment votre token d\'identification'
          ' a expiré.'));
      emit(ArticleLoaded([], isUnauthorizedError: true));
    } on NoServerConnectionError {
      emit(ArticleError(
          'Nous avons rencontrer un probleme lors de la connection au serveur,'
          ' veuillez s\'il vous plait verifier votre connection internet et'
          ' essayer de nouveau'));
      emit(ArticleLoaded([], isNoServerConnectionError: true));
    }
  }

  void updateArticle(Article article, Map<String, dynamic> data) async {
    emit(ArticleLoading());
    await articleRepository.updateArticle(article, data);
    final List<Article> articles = await articleRepository.getArticles();
    emit(ArticleUpdated());
    emit(ArticleLoaded(articles));
  }

  void deleteArticle(Article article) async {
    emit(ArticleLoading());
    await articleRepository.deleteArticle(article);
    final List<Article> articles = await articleRepository.getArticles();
    emit(ArticleDeleted());
    emit(ArticleLoaded(articles, isArticleDeleted: true));
  }

  void articleFilter(List<Article> articles, String text) {
    emit(ArticleLoading());
    List<Article> filteredArticles;
    if (text.isNotEmpty) {
      filteredArticles = articles
          .where((element) =>
              (element.label.toLowerCase().contains(text.toLowerCase())))
          .toList();
      emit(ArticleLoaded(filteredArticles));
    } else {
      emit(ArticleLoaded(articles));
    }
  }

  void createArticle(Map<String, String> data) async {
    emit(ArticleLoading());
    await articleRepository.createArticle(data);
    emit(ArticleCreated());
    final List<Article> articles = await articleRepository.getArticles();
    emit(ArticleLoaded(articles, isArticleDeleted: true));
  }
}
