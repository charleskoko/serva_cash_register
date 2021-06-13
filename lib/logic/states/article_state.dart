part of '../article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleUpdated extends ArticleState {}

class ArticleNotCompany extends ArticleState {}

class ArticleDeleted extends ArticleState {}

class ArticleCreated extends ArticleState {}

class ArticleError extends ArticleState {
  final String message;
  ArticleError(this.message);
}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;
  final bool isArticleDeleted;
  final bool isNoServerConnectionError;
  final bool isUnauthorizedError;
  ArticleLoaded(this.articles,
      {this.isArticleDeleted,
      this.isNoServerConnectionError,
      this.isUnauthorizedError});
}
