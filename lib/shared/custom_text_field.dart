import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.icon,
  });
  final String hint;
  final bool isPassword;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: (v) {
        return null;
      },
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20,
      decoration: InputDecoration(
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white, width: 1.3),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.aBeeZee(),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
