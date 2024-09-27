import 'package:cart_craze/bloc/authentication/loginbloc/login_bloc.dart';
import 'package:cart_craze/bloc/authentication/signupbloc/signup_bloc.dart';
import 'package:cart_craze/bloc/customer_bloc/get_product_screen/get_product_bloc.dart';
import 'package:cart_craze/bloc/splash_bloc/splash_bloc.dart';
import 'package:cart_craze/repo/shared_prefs_repo.dart';
import 'package:cart_craze/screens/retailer/add_product_screen.dart';
import 'package:cart_craze/screens/retailer/get_portfolio.dart';
import 'package:cart_craze/screens/retailer/product_portfolio.dart';
import 'package:cart_craze/screens/retailer/retailer_home_dashboard.dart';
import 'package:cart_craze/screens/splash_screen.dart';
import 'package:cart_craze/screens/splashh_start.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/authentication/get_product_screen/get_product_bloc.dart';
import 'bloc/retailer_add_product/retailer_add_product_bloc.dart';
import 'firebase_options.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final sharedPrefs = SharedPrefs( prefs);
  runApp(MyApp(
    sharedPrefs: sharedPrefs,
  ));
}

class MyApp extends StatelessWidget {
  var sharedPrefs;

  MyApp({Key? key, this.sharedPrefs}) : super(key: key);

  // This widget is the root of your application.
  @override
  build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc(sharedPrefs: sharedPrefs)),
        BlocProvider(create: (context) => LoginBloc(sharedPrefs: sharedPrefs)),
        BlocProvider(create: (context) => SplashBloc(sharedPrefs: sharedPrefs)),
        BlocProvider(create: (context) => RetailerAddProductBloc(sharedPrefs: sharedPrefs)),
        BlocProvider(create: (context) => GetProductBloc(sharedPrefs: sharedPrefs)),
        BlocProvider(create: (context) => GetProductsBloc(sharedPrefs: sharedPrefs)),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
