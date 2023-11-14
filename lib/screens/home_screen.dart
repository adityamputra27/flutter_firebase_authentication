import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/services/firebase_auth_methods.dart';
import 'package:flutter_firebase_authentication/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!user.isAnonymous && user.phoneNumber == null)
                Text(user.email.toString()),
              if (!user.isAnonymous && user.phoneNumber == null)
                Text(user.providerData[0].providerId),
              if (user.phoneNumber != null) Text(user.phoneNumber!),
              Text(user.uid),
              if (!user.emailVerified && !user.isAnonymous)
                CustomButton(
                  text: 'Verify Email',
                  onTap: () {
                    context
                        .read<FirebaseAuthMethods>()
                        .sendEmailVerification(context);
                  },
                ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                text: 'Sign Out',
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(
                text: 'Delete Account',
                onTap: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
