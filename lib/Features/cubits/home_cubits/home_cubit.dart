import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/cubits/home_cubits/home_state.dart';
import 'package:ieee/core/data/news_data_source_imple.dart';
import 'package:ieee/core/state/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(getNewsStatus: AppStatus.initial));

  
  final NewsDataSourceImple _newsDataSource = NewsDataSourceImple();
  Future<void> getNews({required String category}) async {
    emit(state.copyWith(getNewsStatus: AppStatus.loading));
    try {
      final response = await _newsDataSource.getNews(category: category);
      emit(
        state.copyWith(
          getNewsStatus: AppStatus.success,
          responseNewsArticle: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(getNewsStatus: AppStatus.error));
    }
  }
}
