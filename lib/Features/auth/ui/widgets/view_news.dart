import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/routes/app_route_named.dart';

class ViewNews extends StatelessWidget {
  const ViewNews( {
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.publishedAt,

    required this.content,
    required this.category,  required this.author,
  });

  final String title;
  final String category;
  final String description;
  final String imageurl;
  final String publishedAt;
final String author;
  final String content;

  @override
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
            'author': author,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
           
          ),
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
                          child: Image.network(
                            imageurl,
              
                            height: 230,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          category,
                          style: TextStyle(color: AppColor.red, fontSize: 14),
                        ),
                      ),
              
                      Text(
                        description,
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
                          content,
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
              //  ),
            ],
          ),
        ),
      ),
    );
  }
}
