import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/cubits/post_cubit/post_state.dart';
import 'package:ieee/core/local_Data/save_post.dart';
import 'package:ieee/core/local_Data/view_post.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit() : super(PostInitial());
  final SavePost _postRepo= SavePost();
  final ViewPost _viewRepo = ViewPost();

  Future<void> savePost(Map article) async {
    emit(PostLoading());
    try {
      await _postRepo.savePost(article);
     final getPosts = await _postRepo.getSavedPosts();
      emit(PostSuccess(posts: getPosts));
      log("savepost success");
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }
  Future<void> removePost(Map article) async {
    emit(PostLoading());
    try {
     await _postRepo.removePost(article);  
     final getPosts = await _postRepo.getSavedPosts();
      emit(PostSuccess(posts: getPosts));
      log("removepost success");
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }
  Future<void> getSavedPosts() async {
    emit(PostLoading());
    try {
     final getPosts = await _postRepo.getSavedPosts();
      emit(PostSuccess(posts: getPosts));
      log("getsavedpost success");
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }


Future<void> saveViewPost(Map article) async {
  try {
    await _viewRepo.viewPost(article);
    log("view post saved");

    final views = await _viewRepo.getViewPosts();
    emit(ViewPostsSuccess(posts: views));

  } catch (e) {
    emit(PostFailure(error: e.toString()));
  }
}
Future<void> getSavedViewPosts() async {
  emit(PostLoading());
  try{
    final getviewpost= await _viewRepo.getViewPosts();
   
     emit(ViewPostsSuccess(posts: getviewpost)); 
  }catch(e){
    emit(PostFailure(error: e.toString()));
  
  }
}

}