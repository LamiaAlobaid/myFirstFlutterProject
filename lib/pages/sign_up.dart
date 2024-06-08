import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/log_in.dart';
import 'package:flutter_project/models/userr.dart';
import 'package:flutter_project/services/user_data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 101, 60),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Sign up", style: TextStyle(fontSize: 30)),
            const SizedBox(height: 25),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "name",
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "password",
              ),
            ),
            const SizedBox(height: 15),
            MaterialButton(
              onPressed: () async {
                Userr user = Userr(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                await UserData().insertUser(user);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(name: nameController.text,)),
                  (route) => false,
                );
              },
              color: Color.fromARGB(255, 51, 101, 60),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LogInPage()),
                  (route) => false,
                );
              },
              child: const Text(
                "Have an account? Log in",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
