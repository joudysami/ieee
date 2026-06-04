import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ieee/Features/auth/ui/widgets/save_icon.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/routes/app_route_named.dart';
class FirstPostSaved extends StatelessWidget {
  const FirstPostSaved({
    super.key,
    required this.title,
    required this.category,
    required this.description,
    required this.imageurl,
    required this.publishedAt,
    required this.content,
    required this.saved,
  });

  final String title;
  final String category;
  final String description;
  final String imageurl;
  final String publishedAt;

final dynamic saved;
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

      child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BounceIn(
                        duration: Duration(seconds: 2),
                        child: Column(
                          children: [
                            ClipRect(
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                               imageurl,
                                height: 350,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                              category,
                                style: TextStyle(
                                  color: AppColor.red,
                                  fontSize: 18,
                                ),
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
                           
                          SaveIcon(isSaved: true, article: saved,),
                          ],
                        ),
                      ),
                    ),
                  ),
              
             
        
         
     
      ),
    );
  }
}
