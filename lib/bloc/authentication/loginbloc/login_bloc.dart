import 'package:bloc/bloc.dart';
import 'package:cart_craze/repo/shared_prefs_repo.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _auth = FirebaseAuth.instance;
  final SharedPrefs sharedPrefs;

  LoginBloc({required this.sharedPrefs}) : super(LoginInitial()) {
    on<OnLoginEmail>((event, emit) async {
      try {
        emit(LoginLoading());
        final auth = await _auth.signInWithEmailAndPassword(
            email: event.email.toString().trim(),
            password: event.password.toString().trim());
        if (auth.user != null) {
          DatabaseReference ref = FirebaseDatabase.instance.ref(usersTable);
          var event = await ref
              .orderByChild(userId)
              .equalTo("${auth.user!.uid}")
              .onValue
              .first;

          DataSnapshot dataSnapshot = event.snapshot;
          print(dataSnapshot.value);
          final data = await (dataSnapshot.value as Map?)
              ?.map((key, value) => MapEntry(key.toString(), value));

          final keyValue = data?.keys.first;

          if (data != null) {

            print(data[keyValue][email].toString());
            sharedPrefs.setEmail(email: data[keyValue][email].toString());
            sharedPrefs.setUserName(
                userName: data[keyValue][userName].toString());
            sharedPrefs.setUserId(userId: data[keyValue][userId].toString());
            sharedPrefs.setEmail(email: data[keyValue][email].toString());
            sharedPrefs.setUserType(
                userType: data[keyValue][userType].toString());
            sharedPrefs.setIsLoggedIn(isLoggedIn: 'true');
            emit(LoginSuccess(userType: data[keyValue][userType].toString()));
          }
        } else {
          emit(LoginFailure(error: "Something went wrong"));
        }
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
    on<ValidateLogin>((event, emit) {
      emit(LoginLoading());
      if (event.email.toString().trim().isEmpty) {
        emit(ValidationInvalid(error: 'Please enter email'));
      } else if (event.password.toString().trim().isEmpty) {
        emit(ValidationInvalid(error: 'Please enter password'));
      } else if (event.userType.toString().trim().isEmpty) {
        emit(ValidationInvalid(error: 'Please select user type'));
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email.toString().trim())) {
        emit(ValidationInvalid(error: 'Please enter valid email'));
      } else {
        emit(ValidationSuccess());
      }
    });
    on<UserTypeSelection>((event,emit){
      if (event.userType == customer) {
        emit(
            UserTypeCustomerSelectedState(userType: event.userType.toString()));
      } else {
        emit(
            UserTypeRetailerSelectedState(userType: event.userType.toString()));
      }
    });

  }
}
