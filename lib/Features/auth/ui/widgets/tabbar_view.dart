import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/view_news.dart';
import 'package:ieee/Features/cubits/home_cubits/home_cubit.dart';
import 'package:ieee/Features/cubits/home_cubits/home_state.dart';
import 'package:ieee/core/models/aritcles/source.dart';
import 'package:ieee/core/state/state.dart';

class TabbarView extends StatelessWidget {
  const TabbarView({
    super.key,
    required this.sources,
    required HomeCubit homeCubit,
  }) : _homeCubit = homeCubit;

  final List<Source> sources;
  final HomeCubit _homeCubit;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(
        sources.length,
        (index) {
          final source = sources[index];

          return BlocBuilder<HomeCubit, HomeState>(
            bloc: _homeCubit,

            builder: (context, state) {
              final articles = state.responseNewsArticle?.articles ?? [];

              if (state.getNewsStatus.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (articles.isEmpty) {
                return const Center(
                  child: Text("No articles found"),
                );
              }

              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, i) {
                  final article = articles[i];

                  return ViewNews(
                    author: article.author ?? '',
                    
                    
                    title: article.title ?? '',
                    description: article.description ?? '',
                    imageurl: article.urlToImage ?? '',
                    publishedAt: article.publishedAt ?? '',
                   content: article.content ?? '',
                   
                    category: article.source?.name ?? '',
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}