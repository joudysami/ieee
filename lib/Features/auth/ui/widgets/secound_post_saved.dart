import 'package:flutter/material.dart';
import 'package:ieee/Features/auth/ui/widgets/save_icon.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/routes/app_route_named.dart';

class SecoundPostSaved extends StatelessWidget {
   SecoundPostSaved(this.title, this.category, this.publishedAt, this.saved,  {super.key, required this.description,required this.content,required this.imageurl, required this.author});

 final String title;
final String description;
final String content;
  final String imageurl;
  final String author;
  final String category;
final dynamic saved;
  final String publishedAt;

  Set<String> bookmarkedPosts = {};

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutesNamed.article_screen,
          arguments: {
            'title': title,
            'description': description,
            'content': content,
            'imageurl': imageurl,
            'publishedAt': publishedAt,
            'category': category,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 245, 245),
            border: Border.all(color: AppColor.red, width: 1),
            borderRadius: BorderRadius.circular(1),
          ),
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.red,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
      
              Text(
                publishedAt,
                style: TextStyle(
                  color: AppColor.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
      
            SaveIcon(isSaved: true,article:saved),
             
            ],
          ),
        ),
      ),
    );
  }
}
