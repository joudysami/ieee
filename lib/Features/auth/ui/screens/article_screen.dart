import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/floatingButton.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/local_Data/save_post.dart';
import 'package:ieee/core/routes/app_route_named.dart';
import 'package:ieee/core/utils/time.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({
    super.key,
    required this.title,
    required this.description,
    required this.content,
    required this.imageurl,
    required this.publishedAt,
    required this.category,
    required this.author,
  });

  final String title;

  final String description;

  final String content;

  final String imageurl;

  final String publishedAt;

  final String category;

  final String author;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isTextSelected = false;
  bool isShareSelected = false;
  bool isBookmarkSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.red),

          onPressed: () {},
        ),
        title: Row(
          
          children: [
             Text(
              " THE GAZETTE ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            
            Spacer(),
            GestureDetector(
              onTap: ()async {
                await context.read<PostCubit>().saveViewPost({
                  'title': widget.title,
                  'description': widget.description,
                  'content': widget.content,
                  'imageurl': widget.imageurl,
                  'publishedAt': widget.publishedAt,
                  'category': widget.category,
                  'author': widget.author,
                });
                Navigator.pushNamed(context, AppRoutesNamed.profile_screen);
              },
              child: CircleAvatar(backgroundColor: AppColor.red,
             
              ),
            ),
          
           
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: AppColor.red, thickness: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  
                },
                child: Text(widget.category),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColor.red),
                  foregroundColor: MaterialStateProperty.all(AppColor.white),
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'By ',
                        style: TextStyle(
                          color: Color(0xFFC00000),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        widget.author,
                        style: const TextStyle(
                          color: Color(0xFFC00000),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.circle, size: 6, color: AppColor.red),
                  ),
                  Text(
                    Time.timeFormat(widget.publishedAt),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      height: 1.2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.circle, size: 6, color: AppColor.red),
                  ),
                  Text(
                    "Time",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageurl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.brown,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    height: 1.4,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.content,
                  style: TextStyle(color: AppColor.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Floatingactionbuttin(
            icon: Icons.text_fields,
            heroTag: 'translate',
            isSelected: isTextSelected,
            onPressed: () {
              setState(() {
                isTextSelected = !isTextSelected;
              });
            },
          ),
          const SizedBox(height: 10),

          Floatingactionbuttin(
            heroTag: 'share',
            icon: Icons.share,
            isSelected: isShareSelected,
            onPressed: () {
              setState(() {
                isShareSelected = !isShareSelected;
              });
            },
          ),
          const SizedBox(height: 10),

          Floatingactionbuttin(
            icon: Icons.bookmark,
            heroTag: 'bookmark',
            isSelected: isBookmarkSelected,

      onPressed: () async {
  setState(() {
    isBookmarkSelected = !isBookmarkSelected;
  });

  final articleData = {
    "title": widget.title,
    "description": widget.description,
    "urlToImage": widget.imageurl,
    "publishedAt": widget.publishedAt,
    "content": widget.content,
    "author": widget.author,
    "category": widget.category,
  };

  if (isBookmarkSelected) {
    await SavePost().savePost(articleData);
  } else {
    await SavePost().removePost(articleData);
  }


  if (context.mounted) {
    context.read<PostCubit>().getSavedPosts();
  }
},
          ),
        ],
      ),
    );
  }
}
