import 'package:flutter/material.dart';
import 'package:login_with_other/authication/firebase_auth.dart';

import 'loginpage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  final passConfirmController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool changedsetting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
                height: 150,
                width: 110,
                child: Image(
                  image: AssetImage("images/logoIPSUM.png"),
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hintText: "Full Name",
                              fillColor: Color(0xFFEEEEEE),
                              filled: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Full Name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              fillColor: Color(0xFFEEEEEE),
                              filled: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 1,
                            maxLength: 11,
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Phone Number",
                              fillColor: Color(0xFFEEEEEE),
                              filled: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Phone Number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 1,
                            maxLength: 12,
                            controller: passController,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              fillColor: Color(0xFFEEEEEE),
                              filled: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Password";
                              } else if (value.length < 6) {
                                return "Password Should be 8 Character";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 1,
                            maxLength: 12,
                            controller: passConfirmController,
                            decoration: const InputDecoration(
                              hintText: "Confirm Password",
                              fillColor: Color(0xFFEEEEEE),
                              filled: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Password";
                              } else if (value.length < 6) {
                                return "Password Should be 8 Character";
                              }
                              if(passController.text != passConfirmController.text){
        return "Please match your confirm password";
      }
                              return null;
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        moveToSignupPage(context);
                      });
                    },
                    child: Container(
                      color: Colors.purpleAccent,
                      alignment: Alignment.center,
                      height: 47,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          });
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Or Sign Up Using'),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage("images/google_logo.png"),
                              height: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sign In With Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  moveToSignupPage(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changedsetting = true;
      });
      firebaseAuth().register(
        fullName: nameController.text,
        email: emailController.text, 
        phoneNumber: phoneController.text,
        password: passController.text).then((value) => {
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      )
        });
      
      setState(() {
        changedsetting = false;
      });
    }
  }
}
