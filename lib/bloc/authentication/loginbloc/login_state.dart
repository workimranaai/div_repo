part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {
  String? userType;
  LoginSuccess({this.userType});
}
final class LoginLoading extends LoginState {}
final class LoginFailure extends LoginState {
  String error;
  LoginFailure({required this.error});
}
final class ValidationInvalid extends LoginState {
  String error;
  ValidationInvalid({required this.error});
}
final class ValidationSuccess extends LoginState {}

final class UserTypeRetailerSelectedState extends LoginState{
  String userType;
  UserTypeRetailerSelectedState({required this.userType});
}

final class UserTypeCustomerSelectedState extends LoginState{
  String userType;

  UserTypeCustomerSelectedState({required this.userType});
}