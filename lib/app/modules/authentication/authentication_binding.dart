import 'package:get/get.dart';
import 'package:kgchat/app/modules/authentication/authentication_controller.dart';
import 'package:kgchat/app/modules/authentication/authentification_service.dart';

class AuthenticationBinding extends Bindings {
  void dependencies() {
    Get.put<AuthenticationController>(
        AuthenticationController(Get.put(FirebaseAuthenticationService())),
        permanent: true);
  }
}
