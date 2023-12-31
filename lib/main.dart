import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/firebase_options.dart';
import 'package:flutter_firebase_authentication/screens/forgot_password_screen.dart';
import 'package:flutter_firebase_authentication/screens/home_screen.dart';
import 'package:flutter_firebase_authentication/screens/login_email_password_screen.dart';
import 'package:flutter_firebase_authentication/screens/login_screen.dart';
import 'package:flutter_firebase_authentication/screens/phone_screen.dart';
import 'package:flutter_firebase_authentication/screens/signup_email_password_screen.dart';
import 'package:flutter_firebase_authentication/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
        routes: {
          SignEmailPasswordScreen.routeName: (context) =>
              const SignEmailPasswordScreen(),
          LoginEmailPasswordScreen.routeName: (context) =>
              const LoginEmailPasswordScreen(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
          ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
