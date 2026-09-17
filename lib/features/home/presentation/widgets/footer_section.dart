import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  // Hàm mở link
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary, // Nền màu tối
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Lời kêu gọi hành động
          const Text(
            "Let's Connect",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Các icon mạng xã hội
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.email, "nguyenvanthinh3434mc2@gmail.com"),
              const SizedBox(width: 20),
              // Nếu bạn chưa cài font_awesome thì dùng icon tạm của Flutter
              _buildSocialIcon(Icons.code, "https://github.com/nvthih24"),
              const SizedBox(width: 20),
              _buildSocialIcon(
                Icons.work,
                "https://www.linkedin.com/in/thinh-nguyen-van-880904354/",
              ),
            ],
          ),

          const SizedBox(height: 30),
          Divider(color: Colors.grey[800]),
          const SizedBox(height: 20),

          // Copyright
          Text(
            "© 2025 Flutter Portfolio. Built with Flutter Web.",
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      onPressed: () => _launchURL(url),
      icon: Icon(icon, color: Colors.white, size: 30),
      hoverColor: AppColors.secondary, // Hiệu ứng khi di chuột vào
    );
  }
}
