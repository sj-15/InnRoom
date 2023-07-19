import 'package:flutter/material.dart';
import 'package:innroom/components/forms/signin.dart';
import 'package:innroom/components/loginform.dart';
import 'package:innroom/screens/auth_screen.dart';
import 'package:innroom/screens/home_screen.dart';

import 'components/forms/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InnRoom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AuthScreen.routeName: (context) => const AuthScreen(),
        LoginForm.routeName: (context) => const LoginForm(),
        SignInForm.routeName: (context) => const SignInForm(),
        SignUpForm.routeName: (context) => const SignUpForm(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: AuthScreen.routeName,
    );
  }
}
