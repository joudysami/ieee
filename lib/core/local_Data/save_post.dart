import 'dart:developer';

import 'package:hive/hive.dart';

class SavePost {
  Future<void> savePost(Map article) async {
    try {
      final box = await Hive.openBox('savedPosts');
      await box.put(article['title'], article);
    } catch (e) {
      log('Error saving post: $e');
    }
  }

  Future<List<dynamic>> getSavedPosts() async {
    try {
      final box = await Hive.openBox('savedPosts');
   return box.values.toList();
    } catch (e) {
      log('Error retrieving saved posts: $e');
      return [];
    }
  }

  Future<void> removePost(Map article) async {
    try {
      final box = await Hive.openBox('savedPosts');
      await box.delete(article['title']);
    
    } catch (e) {
      log('Error deleting post: $e');
    }
  }
}
