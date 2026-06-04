import 'dart:developer';

import 'package:hive_flutter/adapters.dart';

class ViewPost {
 Future <void> viewPost(Map article) async {
     try {
      final box = await Hive.openBox('viewPosts');
      await box.put(article['title'], article);
    } catch (e) {
      log('Error View post: $e');
    }
  }


  Future<List<dynamic>> getViewPosts() async {
    try {
      final box = await Hive.openBox('viewPosts');
   return box.values.toList();
    } catch (e) {
      log('Error retrieving view posts: $e');
      return [];
    }
  }
}