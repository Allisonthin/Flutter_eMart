import 'package:e_mart/features/authentication/screens/OnBoarding/onBoarding.dart';
import "package:e_mart/utils/theme/theme.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),

    );
  }
}