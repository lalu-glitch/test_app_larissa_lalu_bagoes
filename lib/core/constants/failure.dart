// lib/core/constants/failure.dart
import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);

  factory Failure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure('Periksa jaringan Anda.');
      case DioExceptionType.connectionError:
        return Failure('Tidak dapat terhubung ke server.');
      case DioExceptionType.badResponse:
        return Failure(_mapStatusCode(e.response?.statusCode));

      default:
        return Failure('Terjadi kesalahan. Silakan coba lagi.');
    }
  }

  static String _mapStatusCode(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Data tidak ditemukan.';
      case 500:
        return 'Server sibuk, Coba lagi nanti';
      default:
        return 'Terjadi kesalahan pada server.';
    }
  }
}
