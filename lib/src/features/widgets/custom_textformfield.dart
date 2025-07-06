import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextformfield extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String upperlabel;

  const CustomTextformfield({
    super.key,

    required this.hintText,
    required this.controller,
    this.isPassword = false,
    required this.upperlabel,
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
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: widget.controller,
          obscureText: _isObscured,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            filled: true,
            fillColor: Color(0xFFFAF0E6),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFFCC7861),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,

            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Color(0xFFF4B5A4)),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Color(0xFFF4B5A4)),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Color(0xFFF4B5A4)),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Color(0xFFF4B5A4)),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFDCBEB6),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter ${widget.hintText}";
            }
            return null;
          },
        ),
      ],
    );
  }
}
