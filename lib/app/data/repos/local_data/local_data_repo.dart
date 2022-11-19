import 'package:flutter/material.dart';
import 'package:kgchat/app/data/local_data/countries_with_flags.dart';
import 'package:kgchat/app/modules/phone_verification/views/phone_otp.dart';

class LocalDataRepo {
  static List<DropdownMenuItem<CountryWithFlags>> buildDropDownMenuItems() {
    return CountriesWithFlagsLocalData.buildDropDownMenuItems();
  }
}

final LocalDataRepo localDataRepo = LocalDataRepo();
