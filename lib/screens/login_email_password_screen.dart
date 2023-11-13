import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/services/firebase_auth_methods.dart';
import 'package:flutter_firebase_authentication/utils/showSnackBar.dart';
import 'package:flutter_firebase_authentication/widgets/custom_text_field.dart';

class LoginEmailPasswordScreen extends StatefulWidget {
  static String routeName = '/login-email-password';
  const LoginEmailPasswordScreen({super.key});

  @override
  State<LoginEmailPasswordScreen> createState() =>
      _LoginEmailPasswordScreenState();
}

class _LoginEmailPasswordScreenState extends State<LoginEmailPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    if (emailController.text == '' || passwordController.text == '') {
      showSnackBar(context, 'Email and password is required');
    } else {
      await FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
                obsecureText: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obsecureText: true,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: loginUser,
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
