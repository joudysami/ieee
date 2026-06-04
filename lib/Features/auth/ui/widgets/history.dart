import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/Features/cubits/post_cubit/post_state.dart';
import 'package:ieee/core/constant/app_color.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              print("State isssssssss: $state");
              if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ViewPostsSuccess) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = Map<String, dynamic>.from(state.posts[index]);

                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: BounceIn(
                              duration: Duration(seconds: 2),
                              child: Column(
                                children: [
                                  ZoomIn(
                                    duration: Duration(seconds: 4),
                                    child: ClipRect(
                                      clipBehavior: Clip.antiAlias,
                                      child: () {
                                        final imageUrl =
                                            post['urlToImage'] ??
                                            post['imageurl'] ??
                                            '';
                                        return imageUrl.isNotEmpty
                                            ? Image.network(
                                                imageUrl,
                                                height: 230,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                height: 230,
                                                width: double.infinity,
                                                color: Colors.grey[200],
                                                child: const Icon(
                                                  Icons.image_not_supported,
                                                  size: 48,
                                                  color: Colors.grey,
                                                ),
                                              );
                                      }(),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      post['category'] ?? '',
                                      style: TextStyle(
                                        color: AppColor.red,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    post['description'],
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      post['content'],
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: AppColor.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              if (state is PostFailure) {
                return Center(child: Text(state.error));
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
