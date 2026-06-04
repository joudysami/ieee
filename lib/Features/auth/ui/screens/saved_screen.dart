import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/first_post_saved.dart';

import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/Features/cubits/post_cubit/post_state.dart';
import 'package:ieee/core/constant/app_color.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostCubit>().getSavedPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved News",style: TextStyle(color:AppColor.red),),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            color: AppColor.red,
            height: 1,
          ),
        ),
      ),
      body: Column(
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
                      return FirstPostSaved(
                        title: article['title'] ?? '',
                        category: article['category'] ?? '',
                        description: article['description'] ?? '',
                        imageurl: article['urlToImage'] ?? '',
                        publishedAt: article['publishedAt'] ?? '',
                        content: article['content'] ?? '',
                        saved: article,
                      );   
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
      ),
    );
  }
}