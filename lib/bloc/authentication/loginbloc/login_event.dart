part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnLoginEmail extends LoginEvent {
  String? email;
  String? password;
  String? userType;

  OnLoginEmail({this.email, this.password,this.userType});
}
class ValidateLogin extends LoginEvent {
  String? email;
  String? password;
  String? userType;

  ValidateLogin({this.email, this.password,this.userType});
}
class UserTypeSelection extends LoginEvent{
  String userType;
  UserTypeSelection({required this.userType});
}
