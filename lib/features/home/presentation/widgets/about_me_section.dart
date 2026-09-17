import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Dùng LayoutBuilder để căn lề hai bên cho đẹp (giống HeroSection)
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          color: Colors
              .white, // Nền trắng để phân biệt với Project Section màu xám
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề chính
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nội dung giới thiệu
                  Text(
                    'Là một sinh viên đam mê lập trình Flutter, tôi luôn không ngừng tìm tòi và cập nhật công nghệ mới, đặc biệt là qua các buổi workshop về AI và phát triển phần mềm. Khi không ngồi gõ code, bạn có thể dễ dàng bắt gặp tôi đang ôm laptop cày task ở một quán cà phê quen thuộc, hoặc đang xách balo đi cắm trại ngoài trời để nạp lại năng lượng sáng tạo. Thỉnh thoảng, tôi cũng thích giải tỏa căng thẳng bằng một ván cờ tướng ngoài trời hoặc hòa mình vào không khí sôi động của một trận bóng đá.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.8,
                      color: Colors.grey[800],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Phần Tech Stack
                  _buildTechStackSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTechStackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tech Stack & Tools',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // Nhóm 1: Development
        _buildSkillCategory('Development', [
          'Flutter',
          'Dart',
          'Firebase',
          'MongoDB',
          'Railway',
        ]),
        const SizedBox(height: 16),

        // Nhóm 2: Design & Source Control
        _buildSkillCategory('Design & Source Control', [
          'Figma',
          'GitHub',
          'IntelliJ IDEA',
        ]),
        const SizedBox(height: 16),

        // Nhóm 3: Management
        _buildSkillCategory('Management & Data', ['Jira', 'Excel']),
      ],
    );
  }

  Widget _buildSkillCategory(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) {
            return Chip(
              label: Text(
                skill,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.blue.withValues(alpha: 0.08),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
