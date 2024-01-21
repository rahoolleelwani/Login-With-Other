import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_with_other/view/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          SizedBox(
            height: 180,
            width: 140,
            child: Image(image: AssetImage("images/logoIPSUM.png")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris aliquam nisl sed vehicula tempus. Sed pellentesque.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
                ],
              ),
        ));
  }
}
