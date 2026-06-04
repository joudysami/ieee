import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';
import 'package:ieee/Features/cubits/post_cubit/post_cubit.dart';
import 'package:ieee/core/routes/app_route.dart';
import 'package:ieee/core/routes/app_route_named.dart';
import 'package:ieee/core/themes/app_theme.dart';
import 'package:ieee/core/themes/theme_provider.dart';
import 'package:ieee/firebase_options.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (_) => PostCubit()),
        BlocProvider(create: (_) => UserCubit()),
      
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesNamed.login_screen,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.light,
        themeMode: context.watch<ThemeProvider>().thememode,
      ),
    );
  }
}
