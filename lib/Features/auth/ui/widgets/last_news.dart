import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/routes/app_route_named.dart';

class LastNews extends StatelessWidget {
  const LastNews({
    super.key,
    required this.title,
    required this.category,
    required this.description,
    required this.imageurl,
    required this.publishedAt,
    required this.content,
  });

  final String title;
  final String category;
  final String description;
  final String imageurl;
  final String publishedAt;

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
          },
        );
      },

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              
              ),
              child: Padding(
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
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          category,
                          style: TextStyle(color: AppColor.red, fontSize: 18),
                        ),
                      ),
        
                      Text(
                        description,
                        maxLines: 4,
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          content,
                          maxLines: 3,
                          style: TextStyle(
                            color: AppColor.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //  ),
            Divider(color: AppColor.red, thickness: 1),
        
            Row(
              children: [
                Text(
                  "LATEST REPORTS",
                  style: TextStyle(color: AppColor.red, fontSize: 18),
                ),
                Expanded(child: Divider(color: AppColor.red, thickness: 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
