import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawsa/core/utils/imageutils/app_assets.dart';
import '../../controllers/document_controller.dart';

class AppDrawer extends StatelessWidget {
  final DocumentController controller = Get.find<DocumentController>();

  final List<String> drawerItems = [
    'SRHR & Rs',
    'RAWSA MENA 1',
    'RAWSA MENA 2',
    'RAWSA MENA 3',
    'FAQ',
  ];

  final List<String> filePaths = [
    'assets/doc/doc1.html',
    'assets/doc/doc2.html',
    'assets/doc/doc3.html',
    'assets/doc/doc4.html',
    'assets/doc/faq.html',
  ];

  final List<String> imagePaths = [
    AppAssets.image3,
    AppAssets.image1,
    "",
    AppAssets.image3,
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: drawerItems.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Image.asset(
                AppAssets.image2, // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            );
          }

          if (index == (drawerItems.length + 1)) {
            return ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                controller.iscontactus.value = true;
                controller.selectedIndex(index);
              },
            );
          }
          final actualIndex = index - 1;

          return Obx(() {
            bool isSelected = controller.selectedIndex.value == actualIndex;

            return ListTile(
              title: Text(drawerItems[actualIndex]),
              tileColor: isSelected ? Colors.grey.shade100 : null,
              selected: isSelected,
              selectedTileColor: Colors.grey.shade300,
              onTap: () {
                Navigator.pop(context);
                controller.loadHtml(filePaths[actualIndex]);
                controller.selectedIndex(actualIndex);
                controller.displayImage(imagePaths[actualIndex]);
                controller.iscontactus.value = false;
                // Load the content
              },
            );
          });
        },
      ),
    );
  }
}
