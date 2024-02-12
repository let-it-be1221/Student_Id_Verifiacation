import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_id_verification/pages/SignIn.dart';
import 'package:student_id_verification/pages/SignUp.dart';
import 'package:student_id_verification/providers/user_provider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}



class _SignUpState extends ConsumerState<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _signInkey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //add Image here related to the app
            Text("Sign Up Page"),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _signInkey,
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 234, 234),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!emailValid.hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding: EdgeInsets.only(left: 15),
                          border: InputBorder.none),
                    )),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 234, 234),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return " Please enter atleast 6 characters";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none),
                  ),
                ),
              ],
            )),

            SizedBox(height: 10),
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), 
                  color: Colors.blue),
              child: TextButton(
                onPressed: () async {
                  if (_signInkey.currentState!.validate()) {
                    try {
                      await _auth.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                      await ref
                          .read(userProvider.notifier)
                          .Signup(_emailController.text);
                      if (!mounted) return;
                      Navigator.of(context).pop();
                      print("hello............");
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  }
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an acoount?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Sign In"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
