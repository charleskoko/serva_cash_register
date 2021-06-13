import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/repositories/article_repository.dart';

part 'states/cash_register_state.dart';

class CashRegisterCubit extends Cubit<CashRegisterState> {
  final ArticleRepository _articleRepository;
  CashRegisterCubit(this._articleRepository) : super(CashRegisterInitial()) {
    getArticle();
  }

  Future<void> getArticle() async {
    emit(ProductLoading());
    try {
      final List<Article> articles = await _articleRepository.getArticles();
      emit(ProductLoaded(articles));
    } on UnauthorizedError {
      //TODO: gerer quoi faire ici
    } on NoServerConnectionError {
      //TODO: gerer quoi faire ici
    }
  }
}
