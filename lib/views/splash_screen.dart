import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawsa/core/utils/imageutils/app_assets.dart';
import 'package:rawsa/views/dashboard.dart';

import 'auth/login_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () => Get.off(() => LoginScreen()));


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AppAssets.logo,
            width: 200, height: 200), // Replace with your logo
      ),
    );
  }
}
