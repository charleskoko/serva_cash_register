import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/product.dart';
import 'package:serva_cash_register/data/repositories/product_repositories.dart';

part 'cash_register_state.dart';

class CashRegisterCubit extends Cubit<CashRegisterState> {
  final ProductRepository _productRepository;
  CashRegisterCubit(this._productRepository) : super(CashRegisterInitial());

  Future<void> getArticle() async {
    emit(ProductLoading());
    final List<Product> products = await _productRepository.fetchProduct();
    emit(ProductLoaded(products));
  }
}
