import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../core/constants/failure.dart';
import '../../data/models/product_model.dart';
import '../../domain/respository/products_repository.dart';
import '../services/api_services.dart';

class ProductRepositoryImpl implements ProductsRepository {
  final ApiService _apiService;
  ProductRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await _apiService.getProducts();
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure(e.message ?? 'Network error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
