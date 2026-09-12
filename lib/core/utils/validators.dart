class AppValidators {
  // Validator للإيميل
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }

    // RegEx للتحقق من صحة صيغة الإيميل
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Invalid email address';
    }

    return null; // لا يوجد خطأ
  }

  // Validator لكلمة السر
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    }

    if (value.length < 6) {
      return 'The password must be at least 6 letters/numbers long.';
    }

    return null; // لا يوجد خطأ
  }

  // Validator للاسم (اختياري)
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the name';
    }
    return null;
  }

  // 3. تأكيد كلمة السر (Confirm Password)
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please Confirm the password';
    }

    if (value != password) {
      return 'The password does not match';
    }

    return null;
  }
}
