import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ieee/core/constant/app_endpoints.dart';
import 'package:ieee/core/data/news_data_source.dart';
import 'package:ieee/core/models/aritcles/aritcles.dart';
import 'package:ieee/core/network/api_cleint.dart';

class NewsDataSourceImple implements NewsDataSource {
  final Dio _apiclient = ApiCleint.dio;

  @override
  Future<NewsResponse> getNews({required String sourceId}) async {
    final response = await _apiclient.get(
      '/top-headlines',
      queryParameters: {'sources': sourceId, 'apiKey': AppEndpoints.apiKey},
    );
    log('response: ${response.data}');
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
