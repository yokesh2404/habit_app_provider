import 'package:flutter/material.dart';
import 'package:habit_tracker/src/core/route/routes.dart';
import 'package:habit_tracker/src/core/utils/app_theme.dart';
import 'package:habit_tracker/src/features/home/presentation/controller/home_provider.dart';
import 'package:provider/provider.dart';

class HabitApp extends StatelessWidget {
  const HabitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: Routes.route,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
