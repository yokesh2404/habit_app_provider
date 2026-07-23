import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (_) {
      if (HiveService.isLoggedIn) {
        context.goNamed(AppRouteName.homeName);
      } else {
        context.goNamed(AppRouteName.loginName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: (context.screenWidth / 2),
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
