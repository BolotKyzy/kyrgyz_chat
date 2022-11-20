import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userID;
  final String? name;

  UserModel({this.userID, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [userID, name];
}
