import 'package:flutter/material.dart';
import 'package:innroom/components/loginform.dart';
import 'package:innroom/components/videoslider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 20,
        margin: const EdgeInsets.all(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: VideoSlider(),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
