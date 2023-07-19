import 'package:flutter/material.dart';
import 'package:innroom/components/loginform.dart';
import 'package:innroom/components/photoslider.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/authScreen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF06ACDA).withOpacity(0.3),
      child: Card(
        elevation: 20,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: PhotoSlider(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: 12),
                child: const LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
