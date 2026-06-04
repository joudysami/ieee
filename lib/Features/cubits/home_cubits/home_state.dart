
import 'package:ieee/core/models/aritcles/aritcles.dart';
import 'package:ieee/core/state/state.dart';

class HomeState {
  final AppStatus getNewsStatus;
  final NewsResponse? responseNewsArticle;
  HomeState({required this.getNewsStatus, this.responseNewsArticle});
  HomeState copyWith({
    AppStatus? getNewsStatus,
    NewsResponse? responseNewsArticle,
  }) {
    return HomeState(
      getNewsStatus: getNewsStatus ?? this.getNewsStatus,
      responseNewsArticle: responseNewsArticle ?? this.responseNewsArticle,
    );
  }
}
