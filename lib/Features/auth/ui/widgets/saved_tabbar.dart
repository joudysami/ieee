import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/first_post_saved.dart';
import 'package:ieee/Features/auth/ui/widgets/secound_post_saved.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/Features/cubits/post_cubit/post_state.dart';

class SavedTabbar extends StatefulWidget {
  const SavedTabbar({super.key});

  @override
  State<SavedTabbar> createState() => _SavedTabbarState();
}

class _SavedTabbarState extends State<SavedTabbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<PostCubit, PostState>(
            bloc: context.read<PostCubit>(),
            builder: (context, state) {
              if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostFailure) {
                return Center(child: Text(state.error));
              } else if (state is PostSuccess) {
                final savedPosts = state.posts ?? [];
                if (savedPosts.isEmpty) {
                  return const Center(child: Text("No saved news yet."));
                }
                return ListView.builder(
                  shrinkWrap: true,

                  itemCount: savedPosts.length,
                  itemBuilder: (context, index) {
                    final article = savedPosts[index];

                    if (index == 0) {
                      return FirstPostSaved(
                        title: article['title'] ?? '',
                        category: article['category'] ?? '',
                        description: article['description'] ?? '',
                        imageurl: article['urlToImage'] ?? '',
                        publishedAt: article['publishedAt'] ?? '',
                        content: article['content'] ?? '',
                        saved: article,
                      );
                    } else {
                      return SecoundPostSaved(
                        article['title'] ?? '',
                        article['category'] ?? '',
                        article['publishedAt'] ?? '',
                        author: article['author'] ?? '',
                        article,
                        description: article['description'] ?? '',
                        content: article['content'] ?? '',
                        imageurl: article['urlToImage'] ?? '',
                      );
                    }
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
