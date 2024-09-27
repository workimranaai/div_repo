import 'package:cart_craze/bloc/splash_bloc/splash_event.dart';
import 'package:cart_craze/bloc/splash_bloc/splash_state.dart';
import 'package:cart_craze/repo/shared_prefs_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPrefs sharedPrefs;

  SplashBloc({required this.sharedPrefs}) : super(SplashInitial()) {
    on<SlashInitialEvent>((event, emit) async {
      emit(SplashSuccess(
          loginStatus: sharedPrefs.getIsLoggedIn(),
          userType: sharedPrefs.getUserType()));
    });
  }
}
