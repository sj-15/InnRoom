import 'package:flutter/material.dart';

class HomeBackground extends StatefulWidget {
  const HomeBackground({super.key});

  @override
  State<HomeBackground> createState() => _HomeBackgroundState();
}

class _HomeBackgroundState extends State<HomeBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'images/image6.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
