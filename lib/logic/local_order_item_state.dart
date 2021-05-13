part of 'local_order_item_cubit.dart';

@immutable
abstract class LocalOrderItemState {}

class LocalOrderItemInitial extends LocalOrderItemState {}

class LocalOrderItemLoading extends LocalOrderItemState {}

class LocalOrderItemLoaded extends LocalOrderItemState {
  final List<dynamic> orderItems;
  LocalOrderItemLoaded(this.orderItems);
}
