part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {
  String? userType;
  SignupSuccess({this.userType});
}
final class SignupLoading extends SignupState {}

final class SignupError extends SignupState {
  String error;

  SignupError({required this.error});
}

final class ValidationSuccess extends SignupState {}

final class ValidationError extends SignupState {
  String error;

  ValidationError({required this.error});
}
final class UserTypeRetailerSelectedState extends SignupState{
  String userType;

  UserTypeRetailerSelectedState({required this.userType});
}
final class UserTypeCustomerSelectedState extends SignupState{
  String userType;

  UserTypeCustomerSelectedState({required this.userType});
}
