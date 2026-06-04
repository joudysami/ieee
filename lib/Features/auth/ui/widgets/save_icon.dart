import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/local_Data/save_post.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({super.key, required this.isSaved, this.article});
  final bool isSaved;
  final dynamic article;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,

      child:
       IconButton(
        icon: Icon(
          isSaved ? Icons.bookmark : Icons.bookmark_border,
          color: AppColor.red,
        ),
        onPressed: () async {
          if (isSaved) {
            await SavePost().removePost(article);

            context.read<PostCubit>().getSavedPosts();
          } else {
            await SavePost().savePost(article);
          }
        },
      ),
    );
  }
}
