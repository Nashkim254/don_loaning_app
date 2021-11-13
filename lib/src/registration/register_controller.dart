import 'package:don/src/login/login.dart';
import 'package:don/src/registration/success.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  goToSuccessPagege() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.to(const Login()),
    );

    Get.to(
      const Success(),
    );
  }
}
