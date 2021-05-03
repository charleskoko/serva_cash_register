part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleUpdated extends ArticleState {}

class ArticleNotCompany extends ArticleState {}

class ArticleDeleted extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;
  ArticleLoaded(this.articles);
}
