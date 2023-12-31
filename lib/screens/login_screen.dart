import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/screens/forgot_password_screen.dart';
import 'package:flutter_firebase_authentication/screens/login_email_password_screen.dart';
import 'package:flutter_firebase_authentication/screens/phone_screen.dart';
import 'package:flutter_firebase_authentication/screens/signup_email_password_screen.dart';
import 'package:flutter_firebase_authentication/services/firebase_auth_methods.dart';
import 'package:flutter_firebase_authentication/widgets/custom_button.dart';
import 'package:provider/provider.dart';

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
              text: 'Forgot Password',
              onTap: () {
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
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
              onTap: () {
                context.read<FirebaseAuthMethods>().signInWithGoogle(context);
              },
            ),
            CustomButton(
              text: 'Facebook Sign In',
              onTap: () {
                context.read<FirebaseAuthMethods>().signInWithFacebook(context);
              },
            ),
            CustomButton(
              text: 'Anonymous Sign In',
              onTap: () {
                context.read<FirebaseAuthMethods>().signInAnonymously(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
