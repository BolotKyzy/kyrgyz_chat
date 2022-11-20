import 'package:equatable/equatable.dart';

import '../../data/models/user/user_model.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  List<Object> get props => [];
}

class LoadingState extends AuthenticationState {}

class UnAuthenticationState extends AuthenticationState {}

class NoLocationPermissionState extends AuthenticationState {}

class AuthenticationUserState extends AuthenticationState {
  final UserModel user;
  AuthenticationUserState(this.user);
  List<Object> get props => [];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure(this.message);
  List<Object> get props => [];
}
