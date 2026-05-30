import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/view%20news.dart';
import 'package:ieee/Features/cubits/home_cubits/home_cubit.dart';
import 'package:ieee/Features/cubits/home_cubits/home_state.dart';
import 'package:ieee/core/state/state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _homeCubit.getNews(sourceId: "bbc-news");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          log("state:${state.getNewsStatus}");

          if (state.getNewsStatus == AppStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.getNewsStatus == AppStatus.error) {
            return const Center(child: Text("Something went wrong"));
          }

          if (state.getNewsStatus == AppStatus.success) {
            final articles = state.responseNewsArticle?.articles ?? [];

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];

                return ViewNews(
                  title: article.title ?? '',
                  content: article.content ?? '',
                  url: article.url ??"", 
                  description:article.description??"",
                  imageurl:article.urlToImage??"",
                  
                  publishedAt:article.publishedAt?? '',
                  author: article.author ?? '',
                  category:article.source?.name ??'',
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
