import 'package:flutter/material.dart';
import 'package:ieee/Features/auth/ui/screens/article_screen.dart';
import 'package:ieee/Features/auth/ui/screens/home_screen.dart';
import 'package:ieee/Features/auth/ui/screens/profile_screen.dart';
import 'package:ieee/Features/auth/ui/widgets/saved_tabbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    ArticleScreen(
      title: '',
      description: '',
      content: '',
      imageurl: '',
      publishedAt: '',
      category: '',
      author: '',
    ),
    SavedTabbar(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
