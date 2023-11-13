import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/services/firebase_auth_methods.dart';
import 'package:flutter_firebase_authentication/widgets/custom_button.dart';
import 'package:flutter_firebase_authentication/widgets/custom_text_field.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/phone-signup';
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance).phoneSign(
      context,
      phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: phoneController,
              hintText: 'Enter phone number',
              obsecureText: false,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(text: 'Send OTP', onTap: phoneSignIn),
          ],
        ),
      ),
    );
  }
}
