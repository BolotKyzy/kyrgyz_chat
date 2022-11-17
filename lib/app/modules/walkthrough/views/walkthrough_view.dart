import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kgchat/app/app_widgets/buttons/custom_button_widget.dart';
import 'package:kgchat/app/app_constants/assets/app_assets.dart';
import 'package:kgchat/app/app_constants/text_styles/app_text_styles.dart';

import '../controllers/walkthrough_controller.dart';

class WalkthroughView extends GetView<WalkthroughController> {
  const WalkthroughView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 42),
              child: AppAssets.walkthrough(height: 260.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Connect easily with your family and friends over countries',
                style: AppTextStyles.mulishBlack24w900,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  'Terms & Privacy Policy',
                  style: AppTextStyles.mulishBlack14w600,
                ),
                const SizedBox(height: 10),
                CustomButtonWidget(
                  buttonText: 'Start Messaging',
                  buttonTextStyle: AppTextStyles.mulishWhite16w600,
                  buttonHor: Get.size.width * 0.25,
                  buttonVer: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
