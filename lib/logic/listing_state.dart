part of 'listing_cubit.dart';

@immutable
class ListingState {
   List<Map<String, dynamic>> listing;
   ListingState({@required this.listing});
}

class ListingInitial extends ListingState {
   List<Map<String, dynamic>> listing;
   ListingInitial({@required this.listing});
}

class ListingUpdating extends ListingState{
   ListingUpdating();
}

class ListingUpdated extends ListingState {
   List<Map<String, dynamic>> listing;
   ListingUpdated({@required this.listing}) ;
}
