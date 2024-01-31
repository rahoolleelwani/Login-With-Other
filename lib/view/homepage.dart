import 'package:flutter/material.dart';
import 'package:login_with_other/authication/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Welcome to Home",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
            child: const Text("Sign Out"),
            onPressed: (){
              setState(() {
                firebaseAuth().signOutfb(context);
                firebaseAuth().signOut(context);
              });
            }, 
            )
          ],
        ),
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent,
          onPressed: () {},
          child: const Icon(Icons.add)),
    );
  }
}
