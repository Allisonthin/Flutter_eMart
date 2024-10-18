import 'dart:developer';

import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {

  /// Add widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Init Get  local storage
  await GetStorage.init();

  // todo : Init payment method
  
  /// Await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize firebase and Initialize authentication
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  /// load all the material design/ theme / localizations / bindings
  runApp(const App());
}


