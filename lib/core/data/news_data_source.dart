import 'package:ieee/core/models/aritcles/aritcles.dart';

abstract interface class NewsDataSource {
  Future<NewsResponse> getNews({required String sourceId});
}
