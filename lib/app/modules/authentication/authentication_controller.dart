import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kgchat/app/modules/authentication/authentication_state.dart';
import 'package:kgchat/app/modules/authentication/authentification_service.dart';

import '../../data/models/user/user_model.dart';

class AuthenticationController extends GetxController {
  static final AuthenticationController findAuthcont = Get.find();
  final AuthenticationService _authenticationService;
  final _authState = AuthenticationState().obs;
  final Rx<UserModel> _userModel = UserModel().obs;

  AuthenticationState get state => _authState.value;
  UserModel get getCurrentUser => _userModel.value;
  AuthenticationController(this._authenticationService);
  getAuthenticatedUser() => _getAuthenticatedUser();

  @override
  void onInit() {
    print('AuthenticationController ishtedi');
    // TODO: implement onInit
    _getAuthenticatedUser();
    super.onInit();
  }

  void _getAuthenticatedUser() async {
    _authState.value = LoadingState();
    print('_authState.value: ${_authState.value}');

    final _user = await _authenticationService.getCurentUser();
    if (_user == null || _user == UserModel()) {
      _authState.value = UnAuthenticationState();
      print(' user jok _authState.value: ${_authState.value}');
    } else {
      _authState.value = AuthenticationUserState(_user);
      print('user bar _authState.value: ${_authState.value}');
    }
  }
}
