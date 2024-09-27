import 'package:cart_craze/bloc/authentication/signupbloc/signup_bloc.dart';
import 'package:cart_craze/screens/cart.dart';
import 'package:cart_craze/screens/customer/customer_home_dashboard.dart';
import 'package:cart_craze/screens/onboarding.dart';
import 'package:cart_craze/screens/retailer/retailer_home_dashboard.dart';
import 'package:cart_craze/screens/setting.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:cart_craze/utils/global.dart';
import 'package:cart_craze/utils/loader.dart';
import 'package:cart_craze/utils/my_buttons.dart';
import 'package:cart_craze/utils/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonenoController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String userType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SignUp',
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, signupState) {
          if (signupState is SignupSuccess) {
            if (signupState.userType == retailer) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RetailerHomeDashboard()));
            } else if(signupState.userType == customer){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerHomeDashboard()));
            }else{
              ToastUtil.showToast(message: "Usertype is wrong");
            }
          }
          if (signupState is SignupError) {
            ToastUtil.showToast(message: signupState.error);
          }
          if (signupState is ValidationError) {
            ToastUtil.showToast(message: signupState.error);
          }
          if (signupState is ValidationSuccess) {
            context.read<SignupBloc>().add(OnSignupEvent(
                email: emailController.text,
                password: passwordController.text,
                userName: usernameController.text,
                userType: userType,
                confirmPassword: confirmPasswordController.text,
                phoneNumber: phonenoController.text));
          }
          if (signupState is UserTypeCustomerSelectedState) {
            setState(() {
              userType = signupState.userType;
            });
          }
          if (signupState is UserTypeRetailerSelectedState) {
            setState(() {
              userType = signupState.userType;
            });
          }
        },
        builder: (context, signupState) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            context
                                .read<SignupBloc>()
                                .add(UserTypeSelection(userType: 'retailer'));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: userType == "retailer"
                                  ? Colors.grey[200]
                                  : Colors.white,
                              border: Border.all(
                                  color: userType == "retailer"
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
                            context
                                .read<SignupBloc>()
                                .add(UserTypeSelection(userType: 'customer'));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: userType == "customer"
                                  ? Colors.grey[200]
                                  : Colors.white,
                              border: Border.all(
                                  color: userType == "customer"
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // username textfield
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),

                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    // email textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text('Phone no.'),
                    ),
                    const SizedBox(height: 10),

                    MyTextField(
                      controller: phonenoController,
                      hintText: 'Phone no.',
                      obscureText: false,
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Settings()), // Navigate to RegisterPage
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: () {
                            context.read<SignupBloc>().add(ValidationEvent(
                                userType: userType,
                                confirmPassword: confirmPasswordController.text,
                                userName: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: phonenoController.text));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if(signupState is SignupLoading)...{ApiLoader()},
            ],
          );
        },
      ),
    );
  }
}
