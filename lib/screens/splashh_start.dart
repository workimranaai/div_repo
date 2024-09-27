// import 'package:cart_craze/screens/authentication/login.dart';
// import 'package:flutter/material.dart';
//
// class Starting_splash extends StatefulWidget {
//   const Starting_splash({super.key});
//
//   @override
//   State<Starting_splash> createState() => _Starting_splashState();
// }
//
// class _Starting_splashState extends State<Starting_splash> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       InkWell( onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to RegisterPage
//         );
//       },
//
//         child: Stack(
//
//           children: [
//
//             Positioned(
//                 top: 0,
//                 right: 0,left: 0,
//                 child: Image.asset('assets/images/splash_img.png',fit: BoxFit.fitHeight,)),
//
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 100.0,right: 5),
//                 child: Text('LET’S GO!',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 34,
//                   ),
//                 ),
//               ),
//             ),
//
//           ],),
//       ),
//     );
//   }
// }