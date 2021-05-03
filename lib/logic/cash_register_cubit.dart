import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/repositories/article_repository.dart';

part 'cash_register_state.dart';

class CashRegisterCubit extends Cubit<CashRegisterState> {
  final ArticleRepository _articleRepository;
  CashRegisterCubit(this._articleRepository) : super(CashRegisterInitial()) {
    getArticle();
  }

  Future<void> getArticle() async {
    emit(ProductLoading());
    final List<Article> articles = await _articleRepository.getArticles();
    emit(ProductLoaded(articles));
  }

  void articleFilter(List<Article> articles, String text) async {
    List<Article> filteredArticles;
    if (text.isNotEmpty) {
      print('search');
      filteredArticles = articles
          .where((element) =>
              element.label.toLowerCase().contains(text.toLowerCase()))
          .toList();
      emit(ProductLoaded(filteredArticles));
    } else {
      final List<Article> articles = await _articleRepository.getArticles();
      emit(ProductLoaded(articles));
    }
  }
}
