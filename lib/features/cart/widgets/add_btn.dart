import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';

class AddBtn extends StatelessWidget {
  const AddBtn({super.key, this.onTap, required this.icon});
  final Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(backgroundColor: AppColors.primaryColor, child: icon),
    );
  }
}
