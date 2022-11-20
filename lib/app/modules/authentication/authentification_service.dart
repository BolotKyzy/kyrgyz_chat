import '../../data/models/user/user_model.dart';

abstract class AuthenticationService {
  Future<UserModel> getCurentUser();
  Future<UserModel> getCurrentCashedUser();
  Future<dynamic> signInWithPhone(String phoneNumber);
  Future<bool> signOut();
}

class FirebaseAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel> getCurentUser() async {
    return Future.delayed(Duration(seconds: 1), () {
      return UserModel(userID: '001', name: 'Bak');
    });
  }

  @override
  Future<UserModel> getCurrentCashedUser() {
    // TODO: implement getCurrentCashedUser
    throw UnimplementedError();
  }

  @override
  Future signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException({this.message = "Unknown error occured."});
}
