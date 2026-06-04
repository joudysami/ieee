import 'package:flutter/material.dart';
import 'package:ieee/Features/cubits/home_cubits/home_cubit.dart';
import 'package:ieee/core/models/aritcles/source.dart';

class tabbar extends StatelessWidget {
  const tabbar({
    super.key,
    required this.sources,
    required HomeCubit homeCubit,
  }) : _homeCubit = homeCubit;

  final List<Source> sources;
  final HomeCubit _homeCubit;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Column(children: [
        TabBar(
         
          onTap: (value) {
            final sourceId = sources[value].id;
            if (sourceId == null || sourceId.isEmpty) return;
            
            _homeCubit.getNews(category: 'sourceId');
          },
          tabs: sources
              .map((source) => Tab(
                    text: source.name ?? "",
                  ))
              .toList(),
        ),
      
        
      ]),
    );
  }
}
