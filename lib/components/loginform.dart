import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innroom/components/forms/signin.dart';
import 'package:innroom/components/forms/signup.dart';

class LoginForm extends StatefulWidget {
  static String routeName = '/login_form';
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _signup = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.deepPurpleAccent, // Adjust the color as needed
          child: Container(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            height: size.height * 0.25,
            width: size.width * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF06ACDA).withOpacity(0.3),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'images/innroom.gif',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          _signup ? 'Create your account' : 'Welcome back!',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (!_signup) const SignInForm() else const SignUpForm(),
        const SizedBox(
          height: 15,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OR',
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
            text: !_signup
                ? "Don't have an account? "
                : "Already have an account? ",
            style: const TextStyle(color: Colors.black, fontSize: 12),
            children: [
              TextSpan(
                text: !_signup ? 'Create Account' : 'Log in',
                style: TextStyle(
                  color: const Color(0xFF06ACDA).withOpacity(0.9),
                  fontSize: 12,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(
                      () {
                        _signup = !_signup;
                      },
                    ); // Replace this with your desired action for the link
                  },
              ),
            ],
          ),
        )
      ],
    );
  }
}
