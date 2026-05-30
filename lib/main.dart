import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ieee/core/routes/app_route.dart';
import 'package:ieee/core/routes/app_route_named.dart';
import 'package:ieee/core/themes/app_theme.dart';
import 'package:ieee/core/themes/theme_provider.dart';
import 'package:ieee/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
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
