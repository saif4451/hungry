import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.icon,
    required this.controller,
  });
  final String hint;
  final bool isPassword;
  final Widget? icon;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obsecureText;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.isPassword;
  }

  void _toggelPassword() {
    _obsecureText = !_obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obsecureText,
      validator: (v) {
        if (v == null|| v.isEmpty) {
          return 'please fill the ${widget.hint}';
        }
        return null;
      },
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword == false
            ? null
            : GestureDetector(
                onTap: _toggelPassword,
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.primaryColor,
                ),
              ),

        prefixIcon: widget.icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white, width: 1.3),
        ),
        hintText: widget.hint,
        hintStyle: GoogleFonts.aBeeZee(),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
