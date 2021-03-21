import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/product.dart';
import 'package:serva_cash_register/data/repositories/product_repositories.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;
  ProductCubit(this._productRepository) : super(ProductInitial());

  Future<void> getProducts() async {
    emit( ProductLoading());
    final List<Product> products = await _productRepository.fecthProduct();
    emit(ProductLoaded(products));
  }
}
