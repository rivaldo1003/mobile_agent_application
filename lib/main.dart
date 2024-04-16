import 'dart:io';
import 'package:elderselettricomobile/firebase_options.dart';
import 'package:elderselettricomobile/core/utils/hive_util.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'core/app_providers.dart';
import 'core/dependency_injection.dart' as di;
import 'core/utils/http_overrides.dart';
import 'presentation/splash_screen/splash_screen.dart';

Future<void> mainCommon() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveHelper.initialize();

  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarBrightness: Brightness.light),
    );

    return MultiProvider(
      providers: getAppProviders(),
      child: GetMaterialApp(
        theme: ThemeData(
          primaryColor: brownColor,
          scaffoldBackgroundColor: surfaceColor,
          appBarTheme: AppBarTheme(
            color: surfaceColor,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
