import 'package:flutter/material.dart';

/// A customizable text form field with a label, hint text, and optional password toggle.
class CustomTextformfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String upperlabel;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;

  const CustomTextformfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    required this.upperlabel,
    this.fillColor,
    this.borderColor,
    this.labelStyle,
    this.hintStyle,
    this.validator,
  });

  @override
  _CustomTextformfieldState createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.upperlabel,
          style:
              widget.labelStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscured : false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            filled: true,
            fillColor: widget.fillColor ?? const Color(0xFFFAF0E6),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFFCC7861),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: widget.borderColor ?? const Color(0xFFF4B5A4),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: widget.borderColor ?? const Color(0xFFF4B5A4),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: widget.hintText,
            hintStyle:
                widget.hintStyle ??
                const TextStyle(
                  color: Color(0xFFDCBEB6),
                  fontSize: 16,
                ),
          ),
          validator: (value) {
            return widget.validator?.call(value) ??
                (value == null || value.isEmpty
                    ? 'Please enter ${widget.hintText}'
                    : null);
          },
        ),
      ],
    );
  }
}
