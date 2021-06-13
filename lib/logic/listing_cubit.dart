import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/data_provider/local_user_service_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_saved_order_label_provider.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/order_item_local.dart';
import 'package:serva_cash_register/data/models/service.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:serva_cash_register/data/repositories/listing_repository.dart';
import 'package:serva_cash_register/data/services/listing_service.dart';
import 'package:serva_cash_register/logic/utility.dart';

part 'states/listing_state.dart';

class ListingCubit extends Cubit<ListingState> {
  final ListingRepository _listingRepository;
  ListingCubit(this._listingRepository) : super(ListingState(listing: []));
  LocalSavedOrderLabel _localSavedOrderLabel = LocalSavedOrderLabel();

  void addArticleToListing(Article product,
      {String quantity, double price, Map<String, dynamic> article}) {
    List<Map<String, dynamic>> updatedListing =
        _listingRepository.addArticleToListing(product, state.listing,
            quantity: quantity, price: price, article: article);
    if (state.isFromLocal == true) {
      emit(ListingState(
          listing: updatedListing, isFromLocal: true, label: state.label));
    } else {
      emit(ListingState(listing: updatedListing));
    }
  }

  void removeArticleToList(Article product) {
    List<Map<String, dynamic>> updatedListing =
        _listingRepository.removeArticleToListing(product, state.listing);
    emit(ListingState(listing: updatedListing));
  }

  void deleteList() {
    emit(ListingState(listing: []));
  }

  void saveNewListing(List<Map<String, dynamic>> listing, String text) async {
    final String label = await _listingRepository.saveOrderLabel(text);
    switch (label) {
      case 'isEmpty':
        emit(ListingState(listing: listing, snackBarFor: 'isEmpty'));
        break;
      case 'isNotUnique':
        emit(ListingState(listing: listing, snackBarFor: 'isNotUnique'));
        break;
      default:
        _listingRepository.saveLocalOrder(listing, text);
        emit(ListingState(listing: [], snackBarFor: 'saved', label: text));
    }
  }

  void selectedListFromLocal(String orderItemLabel) async {
    List<Map<String, dynamic>> listing = [];
    final List<OrderItemLocal> orderItems =
        await _listingRepository.selectedLocalListing(orderItemLabel);
    for (OrderItemLocal element in orderItems) {
      listing.add(_listingRepository.createListingElement(element));
    }
    emit(ListingState(
        listing: listing, label: orderItemLabel, isFromLocal: true));
  }

  void updateLocalOrderItemList() async {
    await _listingRepository.deleteLocalListing(state.label);
    await _listingRepository.saveLocalOrder(state.listing, state.label);
    emit(ListingState(
        listing: [], snackBarFor: 'updatedListing', updatedList: state.label));
  }

  void updatedLocalListing() async {
    if (state.isFromLocal == true) {
      final String labelsString =
          await _localSavedOrderLabel.readLocalSavedOrderLabel();
      List<dynamic> labels = jsonDecode(labelsString);
      labels.remove(state.label);
      labels.sort();
      _localSavedOrderLabel.writeLocalSavedOrderLabel(jsonEncode(labels));
      await _listingRepository.deleteLocalListing(state.label);
    } else {}
  }

  void saveOrder(Map<String, dynamic> paymentMethod, {bool withMobile}) async {
    if (withMobile == true) {
      paymentMethod['value'] = Utility.totalNet(state.listing);
      _listingRepository.saveOrderItem(state.listing, paymentMethod);
    } else {
      _listingRepository.saveOrderItem(state.listing, paymentMethod);
    }
  }
}
