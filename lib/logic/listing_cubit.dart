import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/product.dart';
import 'package:serva_cash_register/data/repositories/listing_repository.dart';

part 'listing_state.dart';

class ListingCubit extends Cubit<ListingState> {
  final ListingRepository _listingRepository;
  ListingCubit(this._listingRepository) : super(ListingInitial(listing: []));

  addArticleToListing(Product product) async {
    emit(ListingUpdating());
    List<Map<String, dynamic>> updatedListing =
        _listingRepository.addArticleToListing(product, state.listing);
    print(updatedListing);
    emit(ListingUpdated(listing: updatedListing));
  }

}
