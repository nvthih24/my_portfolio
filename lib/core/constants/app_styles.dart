import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF252733); // Màu than chì sang trọng
  static const secondary = Color(0xFF3751FF); // Màu xanh nổi bật
  static const textPrimary = Color(0xFF252733);
  static const textSecondary = Color(0xFF9FA2B4);
}

class AppTextStyles {
  // Font chính là Poppins (rất hợp cho Portfolio công nghệ)
  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textPrimary,
    height: 1.5, // Giãn dòng cho dễ đọc
  );

  static TextStyle jobTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );
}
