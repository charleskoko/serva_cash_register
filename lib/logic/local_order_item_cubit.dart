import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/data_provider/local_saved_order_label_provider.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:serva_cash_register/data/models/order_item_local.dart';

part 'states/local_order_item_state.dart';

class LocalOrderItemCubit extends Cubit<LocalOrderItemState> {
  LocalOrderItemCubit() : super(LocalOrderItemInitial());
  ServaHelper _servaHelper = ServaHelper();
  LocalSavedOrderLabel _localSavedOrderLabel = LocalSavedOrderLabel();
  void getLocalOrderItems() async {
    final String labelsString =
        await _localSavedOrderLabel.readLocalSavedOrderLabel();
    try {
      List<dynamic> labels = jsonDecode(labelsString);
      labels.sort();
      final List<OrderItemLocal> test =
          await _servaHelper.getOrderItemFromLocalDataBase();
      emit(LocalOrderItemLoaded(labels));
    } on NoSuchMethodError {
      emit(LocalOrderItemLoaded([]));
    }
  }

  void delete(orderItemLabel) async {
    emit(LocalOrderItemLoading());
    final int result = await _servaHelper.deleteOrderITem(orderItemLabel);
    final String labelsString =
        await _localSavedOrderLabel.readLocalSavedOrderLabel();
    List<dynamic> labels = jsonDecode(labelsString);
    labels.remove(orderItemLabel);
    labels.sort();
    _localSavedOrderLabel.writeLocalSavedOrderLabel(jsonEncode(labels));
    final List<OrderItemLocal> test =
        await _servaHelper.getOrderItemFromLocalDataBase();
    emit(LocalOrderItemLoaded(labels));
  }
}
