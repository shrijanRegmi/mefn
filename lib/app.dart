import 'package:flutter/material.dart';
import 'package:mefn/utils/app_router.dart';
import 'package:mefn/utils/app_routes.dart';
import 'package:mefn/utils/app_theme.dart';

class MefnApp extends StatelessWidget {
  const MefnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEFN App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemePalette,
      darkTheme: AppTheme.darkThemePalette,
      initialRoute: AppRoutes.wrapper,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
