import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}
final class SplashSuccess extends SplashState {
  String? userType;
  String? loginStatus;
  SplashSuccess({this.userType,this.loginStatus});
}