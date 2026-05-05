import 'package:get_it/get_it.dart';

import '../../data/repositories/product_repository_impl.dart';
import '../../data/services/api_services.dart';
import '../../domain/respository/products_repository.dart';
import '../../presentation/screens/products/cubit/products_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  sl.registerLazySingleton<ApiService>(() => ApiService());

  sl.registerLazySingleton<ProductsRepository>(
    () => ProductRepositoryImpl(sl<ApiService>()),
  );

  sl.registerFactory(() => ProductsCubit(sl<ProductsRepository>()));
}
