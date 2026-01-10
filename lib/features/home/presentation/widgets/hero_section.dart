import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/constants/app_styles.dart';
import '../../domain/entities/profile_entity.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  final ProfileEntity profile;

  const HeroSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    // ResponsiveBreakpoints giúp ta biết đang ở màn hình nào
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 50,
      ),
      child: isMobile
          ? Column(children: _buildContent(isMobile)) // Mobile: Xếp dọc
          : Row(
              // Desktop: Xếp ngang
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildContent(isMobile),
            ),
    );
  }

  // Hàm trả về danh sách widget để tái sử dụng cho cả Row và Column
  List<Widget> _buildContent(bool isMobile) {
    final imageWidget =
        CircleAvatar(
              radius: isMobile ? 80 : 150, // Ảnh nhỏ hơn trên mobile
              backgroundImage: NetworkImage(profile.avatarUrl),
            )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideX(begin: 0.3, end: 0, curve: Curves.easeOutBack);
    final textWidget =
        Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text("Hello, I'm", style: AppTextStyles.jobTitle),
                const SizedBox(height: 10),
                Text(
                  profile.name,
                  style: AppTextStyles.h1.copyWith(
                    fontSize: isMobile ? 32 : 50,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  profile.description,
                  style: AppTextStyles.body,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    "Download CV",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideX(begin: -0.3, end: 0, curve: Curves.easeOutBack);

    // Nếu là Mobile: Ảnh trước -> Chữ sau
    // Nếu là Desktop: Chữ trước (Expanded để chiếm chỗ) -> Ảnh sau
    return isMobile
        ? [imageWidget, const SizedBox(height: 30), textWidget]
        : [Expanded(child: textWidget), const SizedBox(width: 50), imageWidget];
  }
}
