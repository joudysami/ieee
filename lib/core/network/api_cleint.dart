import 'package:dio/dio.dart';
import 'package:ieee/core/constant/app_endpoints.dart';

class ApiCleint {
  ApiCleint._();
  static final ApiCleint _instance = ApiCleint._();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ),
  );
  static Dio get dio => _instance._dio;
}
