import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/history.dart';
import 'package:ieee/Features/auth/ui/widgets/saved_tabbar.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/core/constant/app_color.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostCubit>().getSavedPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            dividerColor: AppColor.red,
            indicatorColor: AppColor.red,
            unselectedLabelColor: AppColor.brown,
            indicatorWeight: 3,
            labelColor: AppColor.red,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
            ),
            onTap: (index) {
              if (index == 0) {
                context.read<PostCubit>().getSavedPosts();
              } else if (index == 1) {
                context.read<PostCubit>().getSavedViewPosts();
              }
            },
            tabs: const [
              Tab(text: 'SAVED'),
              Tab(text: 'HISTORY'),
              Tab(text: 'FOLLOWING'),
              Tab(text: 'NEWSLETTERS'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: const [
                SavedTabbar(),
                History(),
                Center(child: Text("Following")),
                Center(child: Text("Newsletters")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
