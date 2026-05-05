import 'package:dartz/dartz.dart';
import '../../core/constants/failure.dart';
import '../../data/models/product_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
