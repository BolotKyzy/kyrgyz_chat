import 'package:flutter/material.dart';
import 'package:kgchat/app/app_constants/colors/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? buttonText;
  final TextStyle buttonTextStyle;
  double buttonVer = 10;
  double buttonHor = 40;
  final VoidCallback? onTap;

  CustomButtonWidget(
      {super.key,
      required this.onTap,
      required this.buttonText,
      required this.buttonTextStyle,
      required this.buttonHor,
      required this.buttonVer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: buttonVer, horizontal: buttonHor),
          child: Text(
            buttonText!,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
