import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:innroom/widgets/custom_textfield.dart';

import '../../screens/home_screen.dart';
import '../../widgets/custombutton.dart';
import 'package:http/http.dart' as http;

class SignInForm extends StatefulWidget {
  static String routeName = 'signIn';
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  void _handleSignIn() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    Map<String, dynamic> userData = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/signin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else if (response.statusCode == 401) {
        // Invalid credentials, show error message
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid credentials!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Other status codes, show error message
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred during login!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Network or server error, show error message
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextField(
          controller: emailcontroller,
          label: 'Email*',
          icon: Icons.email,
          iconColor: const Color(0x0006ACDA).withOpacity(0.9),
          keyboardType: TextInputType.emailAddress,
          borderRadius: 24,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          controller: passwordcontroller,
          label: 'Password*',
          icon: Icons.lock,
          iconColor: const Color(0x0006ACDA).withOpacity(0.9),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          borderRadius: 24,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(
                color: const Color(0x0006ACDA).withOpacity(0.9),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomGradientButton(
          onPressed: _handleSignIn,
          gradientColors: [
            Colors.deepPurpleAccent,
            const Color(0xFF06ACDA).withOpacity(0.9),
          ],
          label: 'LogIn',
          borderRadius: 24,
          height: 45,
        ),
      ],
    );
  }
}
