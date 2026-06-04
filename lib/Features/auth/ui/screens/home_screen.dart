import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/screens/Discovery_screen.dart';
import 'package:ieee/Features/auth/ui/screens/profile_screen.dart';
import 'package:ieee/Features/auth/ui/screens/saved_screen.dart';
import 'package:ieee/Features/auth/ui/widgets/last_news.dart';
import 'package:ieee/Features/auth/ui/widgets/view_news.dart';
import 'package:ieee/Features/cubits/home_cubits/home_cubit.dart';
import 'package:ieee/Features/cubits/home_cubits/home_state.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/models/catecory_model.dart';
import 'package:ieee/core/state/state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit;

  int currentIndex = 0;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _homeCubit.getNews(category: "sports");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget _currentPage = currentIndex == 0
        ? _buildNewsPage()
        : currentIndex == 1
        ? SavedScreen()
        : currentIndex == 2
        ? DiscoveryScreen()
        : currentIndex == 3
        ? ProfileScreen()
        : SizedBox();

    return Scaffold(
      body: _currentPage,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.red,
        unselectedItemColor: AppColor.grey,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,

            icon: Icon(Icons.explore),
            label: "Discovery",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.white,
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNewsPage() {
    return DefaultTabController(
      length: CategoryModel.categories.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: AppColor.red),
            onPressed: () {
              
            },
          ),
          title: Row(
            children: [
              const Spacer(),
              Text(
                " THE GAZETTE ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              const CircleAvatar(backgroundColor: AppColor.red),
            ],
          ),
          bottom: TabBar(
            dividerColor: AppColor.red,
            indicatorColor: AppColor.red,
            unselectedLabelColor: AppColor.brown,
            indicatorWeight: 3,
            labelColor: AppColor.red,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: (index) {
              _homeCubit.getNews(category: CategoryModel.categories[index].id);
            },
            tabs: CategoryModel.categories
                .map((category) => Tab(text: category.title))
                .toList(),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          builder: (context, state) {
            log("state:${state.getNewsStatus}");
            if (state.getNewsStatus == AppStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.getNewsStatus == AppStatus.error) {
              return const Center(child: Text("Something went wrong"));
            }
            if (state.getNewsStatus == AppStatus.success) {
              final articles = state.responseNewsArticle?.articles ?? [];
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  if (index == 0) {
                    return LastNews(
                      title: article.title ?? '',
                      content: article.content ?? '',
                      description: article.description ?? "",
                      imageurl: article.urlToImage ?? "",
                      publishedAt: article.publishedAt ?? '',
                      category: article.source?.name ?? '',
                    );
                  }

                  return ViewNews(
                    author: article.author ?? '',
                    title: article.title ?? '',
                    content: article.content ?? '',
                    description: article.description ?? "",
                    imageurl: article.urlToImage ?? "",
                    publishedAt: article.publishedAt ?? '',
                    category: article.source?.name ?? '',
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
