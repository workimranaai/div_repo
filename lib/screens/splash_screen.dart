import 'package:cart_craze/bloc/splash_bloc/splash_bloc.dart';
import 'package:cart_craze/bloc/splash_bloc/splash_event.dart';
import 'package:cart_craze/bloc/splash_bloc/splash_state.dart';
import 'package:cart_craze/screens/authentication/login.dart';
import 'package:cart_craze/screens/customer/customer_home_dashboard.dart';
import 'package:cart_craze/screens/onboarding.dart';
import 'package:cart_craze/screens/retailer/retailer_home_dashboard.dart';
import 'package:cart_craze/utils/custom_strings.dart';
import 'package:cart_craze/utils/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashBloc>().add(SlashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SplashBloc, SplashState>(
      listener: (context, splashState) {
        Future.delayed(Duration(seconds: 3), () {
          if (splashState is SplashSuccess) {
            if (splashState.loginStatus == "true") {
              if (splashState.userType == retailer) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RetailerHomeDashboard()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerHomeDashboard()));
              }
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/splash_img.png',
                  fit: BoxFit.fitHeight,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0, right: 5),
                child: Text(
                  'LET’S GO!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
