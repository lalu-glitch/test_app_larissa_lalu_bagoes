import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/product_model.dart';
import '../../../../domain/respository/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productRepository;
  ProductsCubit(this._productRepository) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await _productRepository.getProducts();
    result.fold((failure) => emit(ProductsError(failure.message)), 
    (data) {
      if (data.isEmpty) {
        emit(ProductsEmpty());
        return;
      }
      emit(ProductsLoaded(data));
    });
  }
}
