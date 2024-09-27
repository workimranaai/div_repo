import 'package:cart_craze/bloc/authentication/loginbloc/login_bloc.dart';
import 'package:cart_craze/screens/customer/customer_home_dashboard.dart';
import 'package:cart_craze/screens/onboarding.dart';
import 'package:cart_craze/screens/authentication/signup.dart';
import 'package:cart_craze/screens/retailer/retailer_home_dashboard.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:cart_craze/utils/global.dart';
import 'package:cart_craze/utils/loader.dart';
import 'package:cart_craze/utils/my_buttons.dart';
import 'package:cart_craze/utils/my_textfield.dart';
import 'package:cart_craze/utils/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String userType = "";

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      backgroundColor: Colors.white,

      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, loginState) {
          if (loginState is LoginSuccess) {

            if (loginState.userType == retailer) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RetailerHomeDashboard()));
            } else if(loginState.userType == customer){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerHomeDashboard()));
            }else{
            ToastUtil.showToast(message: "Usertype is wrong");
          }
          }
          if (loginState is LoginFailure) {
            ToastUtil.showToast(message: loginState.error);
          }
          if (loginState is ValidationInvalid) {
            ToastUtil.showToast(message: loginState.error);
          }
          if (loginState is ValidationSuccess) {
            context.read<LoginBloc>().add(OnLoginEmail(
                email: emailController.text,
                password: passwordController.text));
          }
          if (loginState is LoginFailure) {
            ToastUtil.showToast(message: loginState.error);
          }
          if (loginState is UserTypeCustomerSelectedState) {
            setState(() {
              userType = loginState.userType;
            });
          }
          if (loginState is UserTypeRetailerSelectedState) {
            setState(() {
              userType = loginState.userType;
            });
          }
        },
        builder: (context, loginState) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'User Type',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  context.read<LoginBloc>().add(
                                      UserTypeSelection(userType: retailer));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: userType == retailer
                                        ? Colors.grey[200]
                                        : Colors.white,
                                    border: Border.all(
                                        color: userType == retailer
                                            ? Colors.black
                                            : Colors.black.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10),
                                  child: Text(
                                    'Retailer',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  context.read<LoginBloc>().add(
                                      UserTypeSelection(userType: customer));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: userType == customer
                                        ? Colors.grey[200]
                                        : Colors.white,
                                    border: Border.all(
                                        color: userType == customer
                                            ? Colors.black
                                            : Colors.black.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10),
                                  child: Text(
                                    'Customer',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // username textfield
                        MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),

                        const SizedBox(height: 10),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),

                        const SizedBox(height: 10),

                        // forgot password?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        // sign in button
                        MyButton(
                          onTap: () {
                            context.read<LoginBloc>().add(ValidateLogin(
                                email: emailController.text,
                                password: passwordController.text));
                          },
                        ),

                        const SizedBox(height: 50),

                        const SizedBox(height: 30),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Signup()), // Navigate to RegisterPage
                                );
                              },
                              child: const Text(
                                'Register now',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (loginState is LoginLoading) ...{ApiLoader()}
            ],
          );
        },
      ),
    );
  }
}
