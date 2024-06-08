import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/models/userr.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/sign_up.dart';
import 'package:flutter_project/services/user_data.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
            const Text("Log In", style: TextStyle(fontSize: 30)),
            const SizedBox(height: 25),
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
                var result = await UserData().getSpecificUser(
                    email: emailController.text, password: passwordController.text);
                if (result.isNotEmpty) {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage(name: "Back",)),
                );
                }
              },
              color: Color.fromARGB(255, 51, 101, 60),
              child: const Text(
                "Log in",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                  (route) => false,
                );
              },
              child: const Text(
                "Don't have an account? Sign Up",
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
