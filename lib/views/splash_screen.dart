import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawsa/core/utils/imageutils/app_assets.dart';
import 'package:rawsa/views/dashboard.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3), () => Get.off(() => const Dashboard()));

    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.logo,
            width: 150, height: 150), // Replace with your logo
      ),
    );
  }
}
