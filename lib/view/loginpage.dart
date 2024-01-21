import 'package:flutter/material.dart';
import 'package:login_with_other/authication/firebase_auth.dart';
import 'homepage.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changedsetting = false;
  bool visibiltypass = true;

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "Email",
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              border: InputBorder.none),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please Enter Your Email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passController,
                          maxLines: 1,
                          maxLength: 12,
                          obscureText: visibiltypass,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Password",
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: visibiltypass
                                    ? const Icon(Icons.visibility_off,
                                        color: Colors.grey)
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.purpleAccent,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    visibiltypass = !visibiltypass;
                                  });
                                },
                              )),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please Enter Your Password";
                            } else if (v.length < 8) {
                              return "Please Enter atleast 8 Character";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.purpleAccent),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => moveToHome(context),
                    child: Container(
                      color: Colors.purpleAccent,
                      height: 47,
                      alignment: Alignment.center,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Not registered yet?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          });
                        },
                        child: const Text(
                          'Create an account',
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
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  moveToHome(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changedsetting = true;
      firebaseAuth().login(emailController.text, passController.text).then((value) {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
      });
        changedsetting = false;
      });
    }
  }
}
