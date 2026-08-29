import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.weight,
    required this.size,
  });
  final String text;
  final Color color;
  final FontWeight weight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
