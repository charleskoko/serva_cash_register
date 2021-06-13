part of '../listing_cubit.dart';

class ListingState {
  List<Map<String, dynamic>> listing;
  final String snackBarFor;
  final String label;
  bool isFromLocal;
  final String updatedList;
  ListingState(
      {@required this.listing,
      this.snackBarFor,
      this.label,
      this.isFromLocal,
      this.updatedList});
}
