import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/constants/app_colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: AppColors.greyColor,
      borderRadius: BorderRadius.circular(25),
      child: TextField(
        cursorColor: AppColors.primaryColor,

        cursorHeight: 20,
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey.shade700),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),
          hintText: 'Search...',
          hintStyle: GoogleFonts.aBeeZee(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
