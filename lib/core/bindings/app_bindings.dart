import 'package:get/get.dart';
import '../../controllers/contact_controllers.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
  }
}
