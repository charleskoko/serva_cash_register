import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/product.dart';
import 'package:serva_cash_register/data/repositories/product_repository.dart';

part 'cash_fund_state.dart';

class CashFundCubit extends Cubit<CashFundState> {
  CashFundCubit() : super(CashFundInitial());

  setCashFund(String cashFund) {
    int cashFundConverted;
    if (cashFund == null) {
      cashFundConverted = 0;
    } else {
      cashFundConverted = int.parse(cashFund);
    }

    emit(CashValidated(cashFundConverted));
  }
}
