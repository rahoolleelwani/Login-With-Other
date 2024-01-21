import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_with_other/firebase_options.dart';
import 'package:login_with_other/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      theme: ThemeData(
        cardColor: Colors.purpleAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
