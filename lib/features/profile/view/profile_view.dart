import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // 1. تعريف الـ Controllers لإدارة البيانات وتجهيزها لـ Firebase مستقبلاً
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _passwordController;

  bool _isPasswordObscure = true;

  @override
  void initState() {
    super.initState();
    // إسناد البيانات المبدئية (حالياً Dummy Data وفي المستقبل ستأتي من Firebase)
    _nameController = TextEditingController(text: 'Saif Moamer');
    _emailController = TextEditingController(text: 'gadsaif91@gmail.com');
    _addressController = TextEditingController(text: 'Shibien-Elkoam, EG');
    _passwordController = TextEditingController(text: '12345678');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void _saveProfileData() {
    FocusScope.of(context).unfocus();


    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final address = _addressController.text.trim();
    final password = _passwordController.text.trim();



    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 22.sp),
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(10.h),


              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.w),
                        borderRadius: BorderRadius.circular(24.r),
                        image: const DecorationImage(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30.h),


              _buildEditableField(
                label: 'Name',
                controller: _nameController,
              ),
              Gap(20.h),

              _buildEditableField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(20.h),

              _buildEditableField(
                label: 'Delivery address',
                controller: _addressController,
              ),
              Gap(20.h),

              _buildEditableField(
                label: 'Password',
                controller: _passwordController,
                isPassword: true,
              ),
              Gap(24.h),


              ElevatedButton(
                onPressed: _saveProfileData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Gap(24.h),
              Divider(color: Colors.white24, thickness: 1.h),
              Gap(20.h),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/visa.png',
                      width: 50.w,
                      fit: BoxFit.contain,
                    ),
                    Gap(16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Debit card',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Gap(2.h),
                          Text(
                            '3566 **** **** 0505',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.radio_button_checked,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),

              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && _isPasswordObscure,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white70,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.white70, width: 1.2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.white, width: 1.5.w),
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordObscure ? Icons.lock_outline : Icons.lock_open,
            color: Colors.white70,
            size: 18.sp,
          ),
          onPressed: () {
            setState(() {
              _isPasswordObscure = !_isPasswordObscure;
            });
          },
        )
            : null,
      ),
    );
  }
}