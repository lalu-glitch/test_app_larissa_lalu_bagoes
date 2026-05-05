import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';
import '../models/product_model.dart';

class ApiService {
  final _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          //sementara
          if (e.response?.statusCode == 404) {
            print('Not Found: ${e.requestOptions.path}');
          } else if (e.response?.statusCode == 401) {
            print('Unauthorized');
          } else if (e.response?.statusCode == 500) {
            print('Server Error');
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get(ApiConstants.products);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception("Gagal memuat data");
      }
    } on DioException catch (e) {
      final apiMessage = e.response?.data?['message'];
      if (apiMessage != null) {
        throw Exception(apiMessage);
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
