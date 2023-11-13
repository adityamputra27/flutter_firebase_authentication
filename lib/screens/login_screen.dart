import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/screens/login_email_password_screen.dart';
import 'package:flutter_firebase_authentication/screens/phone_screen.dart';
import 'package:flutter_firebase_authentication/screens/signup_email_password_screen.dart';
import 'package:flutter_firebase_authentication/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Email/Password Sign Up',
              onTap: () {
                Navigator.pushNamed(context, SignEmailPasswordScreen.routeName);
              },
            ),
            CustomButton(
              text: 'Email/Password Login',
              onTap: () {
                Navigator.pushNamed(
                    context, LoginEmailPasswordScreen.routeName);
              },
            ),
            CustomButton(
              text: 'Phone Sign In',
              onTap: () {
                Navigator.pushNamed(context, PhoneScreen.routeName);
              },
            ),
            CustomButton(
              text: 'Google Sign In',
              onTap: () {},
            ),
            CustomButton(
              text: 'Facebook Sign In',
              onTap: () {},
            ),
            CustomButton(
              text: 'Anonymous Sign In',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
