import 'package:flutter/material.dart';
import 'package:innroom/screens/home_screen.dart';
import '../../models/usermodel.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custombutton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpForm extends StatefulWidget {
  static String routeName = '/signUp';
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignUp() async {
    // Get user input from text fields
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Create a UserModel object without the uid
    UserModel newUser = UserModel(
      name: name,
      email: email,
      password: password,
    );

    // Convert UserModel object to a map
    Map<String, dynamic> userMap = newUser.toMap();

    // Send the signup request to the server
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userMap),
      );

      if (response.statusCode == 201) {
        // Signup successful, extract the uid from the response

        // Update the UserModel object with the correct uid
        newUser = UserModel(
          name: name,
          email: email,
          password: password,
        );

        // Navigate to the home screen
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else if (response.statusCode == 409) {
        // User already exists, show error message
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Email is already available! Please login.'),
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
            content: const Text('An error occurred during registration!'),
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
      children: [
        CustomTextField(
          controller: _nameController,
          label: 'Full Name*',
          icon: Icons.person,
          iconColor: const Color(0x0006ACDA).withOpacity(0.9),
          keyboardType: TextInputType.text,
          borderRadius: 24,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          controller: _emailController,
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
          controller: _passwordController,
          label: 'Password*',
          icon: Icons.lock,
          iconColor: const Color(0x0006ACDA).withOpacity(0.9),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          borderRadius: 24,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomGradientButton(
          onPressed: _handleSignUp,
          gradientColors: [
            Colors.deepPurpleAccent,
            const Color(0xFF06ACDA).withOpacity(0.9),
          ],
          label: 'SignUp',
          borderRadius: 24,
          height: 45,
        ),
      ],
    );
  }
}
