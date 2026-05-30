
import 'package:flutter/material.dart';

class ViewNews extends StatelessWidget {
  const ViewNews({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.publishedAt,
    required this.author,
    this.content, this.url, required this.category,
  });

  final String title;
  final String category;
  final String description;
  final String imageurl;
  final String publishedAt;
  final String author;
  final String? content;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        imageurl,
                        height: 230,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),Text(
                      category,
                      style: TextStyle(color: Colors.white),
                    ),

                    Text(
                      description,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(publishedAt)),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          author,
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
            ),
          ),
      //  ),
      ],
    );
  }
}
