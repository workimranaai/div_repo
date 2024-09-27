import 'package:bloc/bloc.dart';
import 'package:cart_craze/repo/shared_prefs_repo.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final _auth = FirebaseAuth.instance;
  final SharedPrefs sharedPrefs;

  SignupBloc({required this.sharedPrefs}) : super(SignupInitial()) {
    on<OnSignupEvent>((event, emit) async {
      emit(SignupLoading());
      var auth = await _auth
          .createUserWithEmailAndPassword(
              email: event.email.toString().trim(),
              password: event.password.toString().trim())
          .catchError((error) {
        emit(SignupError(error: error));
      });
      if (auth.user != null) {
        DatabaseReference databaseRef = FirebaseDatabase.instance.ref(usersTable);
        var response = await databaseRef.push().set({
          userId: auth.user!.uid.toString().trim(),
          userType: event.userType.toString().trim(),
          userName: event.userName.toString().trim(),
          email: event.email.toString().trim(),
          phoneNumber: event.phoneNumber.toString().trim(),
        });
       sharedPrefs.setEmail(email: event.userType.toString().trim());
       sharedPrefs.setUserName(userName: event.userName.toString().trim());
       sharedPrefs.setUserId(userId: auth.user!.uid.toString().trim());
       sharedPrefs.setEmail(email: event.userType.toString().trim());
       sharedPrefs.setUserType(userType: event.userType.toString().trim());
        sharedPrefs.setIsLoggedIn(isLoggedIn: 'true');
        emit(SignupSuccess(userType: event.userType.toString()));
      }

    });
    on<ValidationEvent>((event, emit) {
      emit(SignupLoading());
      if (event.userType.toString().trim().isEmpty) {
        emit(ValidationError(error: 'Please select user type'));
      } else if (event.userName.toString().trim().isEmpty) {
        emit(ValidationError(error: 'Please enter user name'));
      } else if (event.email.toString().trim().isEmpty) {
        emit(ValidationError(error: 'Please enter email'));
      } else if (event.password.toString().trim().isEmpty) {
        emit(ValidationError(error: 'Please enter password'));
      } else if (event.confirmPassword.toString().trim().isEmpty) {
        emit(ValidationError(error: 'Please enter confirm password'));
      } else if (event.phoneNumber.toString().trim().isEmpty) {
        emit(ValidationError(error: 'Please enter phone number'));
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email.toString().trim())) {
        emit(ValidationError(error: 'Please enter valid email'));
      } else if (event.confirmPassword.toString() !=
          event.password.toString()) {
        emit(ValidationError(
            error: 'confirm password should not be same as password'));
      } else {
        emit(ValidationSuccess());
      }
    });
    on<UserTypeSelection>((event, emit) async {
      if (event.userType == "customer") {
        emit(
            UserTypeCustomerSelectedState(userType: event.userType.toString()));
      } else {
        emit(
            UserTypeRetailerSelectedState(userType: event.userType.toString()));
      }
    });
  }
}
