import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rawsa/core/utils/imageutils/app_assets.dart';

class DocumentController extends GetxController {
  var htmlContent = ''.obs;
  Rx<bool> isLoading = true.obs;
  var iscontactus = false.obs;
  var displayImage = AppAssets.image3.obs;
  var selectedIndex = 0.obs; // Track the selected index

  @override
  void onInit() {
    super.onInit();
    loadHtml('assets/doc/doc1.html'); // Default document
  }

  Future<void> loadHtml(String filePath) async {
    try {
      isLoading.value = true;
      print(isLoading.value);
      final String content = await rootBundle.loadString(filePath);
      htmlContent(content);
      isLoading.value = false;
    } catch (e) {
      htmlContent("Error loading document: $e");
    } finally {
      isLoading(false);
    }
  }
}
