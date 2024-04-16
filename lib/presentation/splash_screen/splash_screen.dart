import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../flavors.dart';
import '../../core/values/constants.dart';
import '../bluetooth/device_screen.dart';
import '../home/main_bottom_navigation.dart';
import '../onboarding/get_started.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  Future<Timer> splashScreenStart() async {
    final pref = await SharedPreferences.getInstance();

    if (FlavorConfig.appFlavor == Flavor.DEV) {
      return Timer(Duration(milliseconds: 2000), () {
        _navigateToNextPage(pref);
      });
    }

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      final accessToken = pref.getString(KEY_ACCESS_TOKEN);
      if (accessToken == null) {
        return Timer(Duration(milliseconds: 2000), _navigateToStartPage);
      } else {
        return Timer(Duration(milliseconds: 2000), () {
          _navigateToNextPage(pref);
        });
      }
    }

    final start = DateTime.now().millisecondsSinceEpoch;
    try {
      final client = Get.find<Dio>();
      final response = await client.get('/validate');
      final end = DateTime.now().millisecondsSinceEpoch;
      final timeDiff = 2000 - (end - start);
      final duration = Duration(milliseconds: timeDiff < 0 ? 0 : timeDiff);
      return Timer(duration, () async {
        if (response.statusCode == 200) {
          _navigateToNextPage(pref);
        } else {
          _navigateToStartPage();
        }
      });
    } catch (e) {
      final end = DateTime.now().millisecondsSinceEpoch;
      final timeDiff = 2000 - (end - start);
      final duration = Duration(milliseconds: timeDiff < 0 ? 0 : timeDiff);
      return Timer(duration, _navigateToStartPage);
    }
  }

  void _navigateToNextPage(SharedPreferences pref) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        final deviceId = pref.getString(KEY_LAST_CONNECTED_DEVICE);
        if (deviceId != null) return DeviceScreen(deviceId: deviceId);
        return MainBottomNavigationPage();
      }),
    );
  }

  void _navigateToStartPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return GetStarted();
    }));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/icons/elders_font.png',
            height: 140,
            width: 140,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
