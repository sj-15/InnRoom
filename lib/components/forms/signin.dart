import 'package:flutter/material.dart';
import 'package:innroom/components/forms/signup.dart';
import 'package:innroom/widgets/custom_textfield.dart';

import '../../screens/home_screen.dart';
import '../../widgets/custombutton.dart';

class SignInForm extends StatefulWidget {
  static String routeName = 'signIn';
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

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
          onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
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
