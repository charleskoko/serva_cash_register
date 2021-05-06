import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/repositories/listing_repository.dart';

part 'listing_state.dart';

class ListingCubit extends Cubit<ListingState> {
  final ListingRepository _listingRepository;
  ListingCubit(this._listingRepository) : super(ListingState(listing: []));

  void addArticleToListing(Article product,
      {String quantity, double price, Map<String, dynamic> article}) {
    List<Map<String, dynamic>> updatedListing =
        _listingRepository.addArticleToListing(product, state.listing,
            quantity: quantity, price: price, article: article);
    emit(ListingState(listing: updatedListing));
  }

  void removeArticleToList(Article product) {
    List<Map<String, dynamic>> updatedListing =
        _listingRepository.removeArticleToListing(product, state.listing);
    emit(ListingState(listing: updatedListing));
  }

  void deleteList() {
    emit(ListingState(listing: []));
  }
}
