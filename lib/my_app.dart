import "package:e_mart/binding/general_binding.dart";
import "package:e_mart/utils/constant/colors.dart";
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
      initialBinding: GeneralBinding(),
      home: const Scaffold(
        backgroundColor: TColor.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: TColor.white,
          ),
        ),
      ),
    );
  }
}
