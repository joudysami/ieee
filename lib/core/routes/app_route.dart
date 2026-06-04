import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/screens/Discovery_screen.dart';
import 'package:ieee/Features/auth/ui/screens/article_screen.dart';
import 'package:ieee/Features/auth/ui/screens/home_screen.dart';
import 'package:ieee/Features/auth/ui/screens/login_screen.dart';
import 'package:ieee/Features/auth/ui/screens/profile_screen.dart';
import 'package:ieee/Features/auth/ui/screens/saved_screen.dart';

import 'package:ieee/Features/auth/ui/screens/sign_up.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';
import 'package:ieee/Features/cubits/home_cubits/home_cubit.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/core/routes/app_route_named.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings Settings) {
    switch (Settings.name) {
      case AppRoutesNamed.login_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case AppRoutesNamed.sign_up_screen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => AuthCubit(), child: SignUp()),
        );
      case AppRoutesNamed.home_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: HomeScreen(),
          ),
        );
      case AppRoutesNamed.article_screen:
        final args = Settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
         builder: (_) => MultiBlocProvider(
            providers: [
             BlocProvider(create: (context) => PostCubit()),
              BlocProvider(create: (context) => HomeCubit()),
            ],
            child: ArticleScreen(
              title: args?['title'] ?? '',
              description: args?['description'] ?? '',
              content: args?['content'] ?? '',
              imageurl: args?['imageurl'] ?? '',
              publishedAt: args?['publishedAt'] ?? '',
              category: args?['category'] ?? '',
              author: args?['author'] ?? '',
            ),
          ),
        );
        case AppRoutesNamed.profile_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(),
            child: ProfileScreen(),
          ),
        
         
        
      );


      case AppRoutesNamed.saved_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PostCubit(),
            child:SavedScreen (),
          ),
        );
        
      case AppRoutesNamed.discovery_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PostCubit(),
            child:DiscoveryScreen (),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Container();
          },
        );
    }
  }
}
