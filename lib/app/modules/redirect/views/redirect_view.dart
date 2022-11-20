import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kgchat/app/modules/authentication/authentication_controller.dart';
import 'package:kgchat/app/modules/authentication/authentication_state.dart';
import 'package:kgchat/app/modules/home/views/home_view.dart';
import 'package:kgchat/app/modules/phone_verification/views/phone_verification_view.dart';

import '../controllers/redirect_controller.dart';

class RedirectView extends StatelessWidget {
  final AuthenticationController _authCont =
      AuthenticationController.findAuthcont;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authCont.state is LoadingState) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (_authCont.state is UnAuthenticationState) {
        return PhoneVerificationView();
      } else if (_authCont.state is AuthenticationUserState) {
        return HomeView();
      }
      return Scaffold(
        body: Center(child: Text("Someting went wrong! Please try again))")),
      );
    });
  }
}
