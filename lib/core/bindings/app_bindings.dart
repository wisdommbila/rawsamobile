import 'package:get/get.dart';
import 'package:rawsa/controllers/document_controller.dart';
import '../../controllers/contact_controllers.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
    Get.lazyPut(() => DocumentController());
  }
}
