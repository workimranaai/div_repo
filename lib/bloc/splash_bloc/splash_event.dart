import 'package:equatable/equatable.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent ();

  @override
  List<Object> get props => [];
}

class SlashInitialEvent extends SplashEvent {}