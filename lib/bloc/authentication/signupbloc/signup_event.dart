part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
class OnSignupEvent extends SignupEvent{
  String? userName,email,password,phoneNumber,userType,confirmPassword;

  OnSignupEvent({this.userName,this.email,this.password,this.phoneNumber,this.userType,this.confirmPassword});
}

class ValidationEvent extends SignupEvent{
  String? userName,email,password,phoneNumber,userType,confirmPassword;

  ValidationEvent({this.userName,this.email,this.password,this.phoneNumber,this.userType,this.confirmPassword});
}

class UserTypeSelection extends SignupEvent{
String userType;
  UserTypeSelection({required this.userType});
}
