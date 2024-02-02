import 'package:get/get.dart';
import 'package:next_contact_app/modules/contact/contact.dart';

class Routes {
  static routeTo({required String type, dynamic data}) {
    if (type == "add-contact") {
      Get.to(
        ContactAddView(
          controller: data[0],
        ),
        duration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeftWithFade,
      );
    }
  }

  static routeOff({required String type, dynamic data}) {
    if (type == "contact") {
      Get.offAll(
        const ContactView(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.leftToRightWithFade,
      );
    }
  }
}
