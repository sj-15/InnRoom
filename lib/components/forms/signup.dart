import 'package:flutter/material.dart';
import 'package:innroom/screens/home_screen.dart';

import '../../widgets/custom_textfield.dart';
import '../../widgets/custombutton.dart';

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
          onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
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
