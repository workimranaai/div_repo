import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiLoader extends StatelessWidget {
  const ApiLoader({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width,
      height: mediaQuery.height,
      color: Colors.white.withOpacity(0.2),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
