import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/repositories/article_repository.dart';
part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleRepository articleRepository;
  ArticleCubit(this.articleRepository) : super(ArticleInitial()) {
    getArticles();
  }
  ServaHelper _servaHelper = ServaHelper();

  void getArticles() async {
    emit(ArticleLoading());
    final List<Article> articles = await articleRepository.getArticles();
    for (Article article in articles) {
      _servaHelper.insertArticle(article);
    }
    emit(ArticleLoaded(articles));
  }

  void updateArticle(Article article, Map<String, dynamic> data) {
    emit(ArticleLoading());
    // request pour update l'article
    emit(ArticleUpdated());
  }

  void deleteArticle(Article article) {
    emit(ArticleLoading());
    //request pour supprimer l'article
    emit(ArticleDeleted());
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
}
