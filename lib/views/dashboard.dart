import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:rawsa/views/contact_us.dart';
import 'package:rawsa/views/help_me.dart';
import 'package:rawsa/views/widgets/app_drawer.dart';
import '../controllers/document_controller.dart';
import '../core/utils/imageutils/app_assets.dart';

class MainPage extends StatelessWidget {
  final DocumentController controller = Get.put(DocumentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("RAWSA"),
        actions: [
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                Get.to(HelpMePage());
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.red), // Replace Colors.blue with your desired color
              ),
              child: const Text("HELP ME", style: TextStyle(color: Colors.white),),
            ),
          ),
          SizedBox(width: 20,)
        ],
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return controller.iscontactus.value
            ? ContactUsPage()
            : SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (controller.displayImage.value.isNotEmpty)
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          controller.displayImage.value,
                          fit: BoxFit.fill,
                        ),
                      ),
                    HtmlWidget(
                      controller.htmlContent.value, // Render HTML content
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
