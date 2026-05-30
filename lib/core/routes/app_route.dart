import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/screens/home_screen.dart';
import 'package:ieee/Features/auth/ui/screens/login_screen.dart';
import 'package:ieee/Features/auth/ui/screens/sign_up.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';
import 'package:ieee/Features/cubits/home_cubits/home_cubit.dart';
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
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Container();
          },
        );
    }
  }
}
