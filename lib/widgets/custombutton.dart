import 'package:flutter/material.dart';

class CustomGradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final String label;
  final double width;
  final double height;
  final double borderRadius;

  const CustomGradientButton({
    super.key,
    required this.onPressed,
    required this.gradientColors,
    required this.label,
    this.width = 200.0,
    this.height = 50.0,
    this.borderRadius = 8.0,
  });

  @override
  State<CustomGradientButton> createState() => _CustomGradientButtonState();
}

class _CustomGradientButtonState extends State<CustomGradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          // width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered
                  ? [
                      widget.gradientColors[0].withOpacity(0.1),
                      widget.gradientColors[1].withOpacity(0.1),
                    ]
                  : widget.gradientColors,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: _isHovered ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
