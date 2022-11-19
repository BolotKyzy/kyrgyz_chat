import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kgchat/app/app_constants/colors/app_colors.dart';
import 'package:kgchat/app/app_constants/text_styles/app_text_styles.dart';
import 'package:kgchat/app/app_constants/widgets/app_constant_widgets.dart';
import 'package:kgchat/app/app_widgets/buttons/custom_button_widget.dart';
import 'package:kgchat/app/data/repos/local_data/local_data_repo.dart';
import 'package:kgchat/app/modules/phone_verification/views/phone_otp.dart';
import 'package:kgchat/app/modules/phone_verification/views/phone_otp.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import '../../../data/local_data/countries_with_flags.dart';

class PhoneVerificationView extends StatefulWidget {
  PhoneVerificationView({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String _userPhoneNumber = '';

  List<DropdownMenuItem<CountryWithFlags>>? _dropDownMenuItems;

  CountryWithFlags? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = LocalDataRepo.buildDropDownMenuItems();
    _selectedCountry = _dropDownMenuItems![0].value;
  }

  void _onKeyboardTap(String value) {
    setState(() {
      if (_selectedCountry!.phoneCode!.length == 4) {
        if (_userPhoneNumber.length < 9) {
          _userPhoneNumber = _userPhoneNumber + value;
        }
      } else if (_selectedCountry!.phoneCode!.length == 2) {
        if (_userPhoneNumber.length < 10) {}
      } else if (_selectedCountry!.phoneCode!.length == 3) {
        if (_userPhoneNumber.length < 10) {}
      }
    });
    print('text: $_userPhoneNumber');
  }

  Widget _phoneContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: Get.size.width * 0.25,
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(2)),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(2.0),
              child: DropdownButton<CountryWithFlags>(
                underline: AppConstantWidgets.emptyWidget,
                icon: AppConstantWidgets.emptyWidget,
                value: _selectedCountry,
                items: _dropDownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 45,
          width: Get.size.width * 0.65,
          decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(2))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  _userPhoneNumber == '' ? 'Phone number' : _userPhoneNumber,
                  style: AppTextStyles.mulishBlack14w600,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.black.withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: 16,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (Get.size.width * 0.05) - 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            'Enter Your Phone Number',
                            style: AppTextStyles.mulishBlack24w900,
                          ),
                          Text(
                            'Please confirm your country code and enter your phone number',
                            style: AppTextStyles.mulishBlack14w600,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      _phoneContainer()
                    ],
                  )),
                  CustomButtonWidget(
                      onTap: () {
                        String? _code;
                        if (_userPhoneNumber.isEmpty) {
                          Get.snackbar(
                              'Warning', 'Please put your phone number!');
                        } else if (_selectedCountry!.phoneCode == '+996' &&
                            _userPhoneNumber.length == 9) {
                          _code = _setCodeBeforeSending();
                          setState(() {});
                        } else if (_selectedCountry!.phoneCode == '+7' &&
                            _userPhoneNumber.length == 10) {
                          _code = _setCodeBeforeSending();
                          setState(() {});
                        } else if (_selectedCountry!.phoneCode == '90' &&
                            _userPhoneNumber.length == 10) {
                          _code = _setCodeBeforeSending();
                          setState(() {});
                        }

                        // if (_userPhoneNumber.isNotEmpty) {
                        //   Get.to(() => PhoneOtp(code: _code));
                        // }
                        else {
                          Get.snackbar(
                              'Warning', 'Please enter correct phone number!');
                        }
                        print('code======> $_code');
                      },
                      buttonText: 'Continue',
                      buttonTextStyle: AppTextStyles.mulishWhite16w600,
                      buttonHor: Get.size.width * 0.35,
                      buttonVer: 15),
                  const SizedBox(height: 24.0),
                ],
              ),
            )),
            Container(
                color: AppColors.mainColor.withOpacity(0.1),
                child: NumericKeyboard(
                  onKeyboardTap: _onKeyboardTap,
                  textColor: AppColors.black,
                  rightIcon: Icon(
                    Icons.backspace,
                    color: AppColors.black,
                  ),
                  rightButtonFn: () {
                    setState(() {
                      if (_userPhoneNumber.isNotEmpty) {
                        _userPhoneNumber = _userPhoneNumber.substring(
                            0, _userPhoneNumber.length - 1);
                      }
                    });
                  },
                ))
          ])),
    );
  }

  String _setCodeBeforeSending() {
    return _selectedCountry!.phoneCode! + ' ' + _userPhoneNumber;
  }
}
