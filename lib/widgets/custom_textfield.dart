import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final Color? cursorColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final double? iconPadding;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.iconColor,
    this.textColor,
    this.cursorColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.contentPaddingVertical,
    this.contentPaddingHorizontal,
    this.iconPadding,
    this.obscureText = false,
    this.readOnly = false,
    required this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      style: TextStyle(color: widget.textColor),
      cursorColor: widget.cursorColor,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.iconColor,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.contentPaddingVertical ?? 12.0,
          horizontal: widget.contentPaddingHorizontal ?? 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey,
            width: widget.borderWidth ?? 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          borderSide: BorderSide(
            color: widget.cursorColor ?? Colors.blue,
            width: widget.borderWidth ?? 1.0,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: widget.iconColor,
                ),
              )
            : null,
      ),
    );
  }
}
