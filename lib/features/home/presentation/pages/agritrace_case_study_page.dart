import 'package:flutter/material.dart';

class AgritraceCaseStudyPage extends StatelessWidget {
  const AgritraceCaseStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Chi tiết dự án',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Tiêu đề dự án
                Text(
                  'Agritrace',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ứng dụng di động minh bạch hóa chuỗi cung ứng nông sản',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),

                // 2. Điểm nhấn Thành tích (Rất quan trọng để thu hút ánh nhìn)
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.orange.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.workspace_premium,
                        color: Colors.orange,
                        size: 48,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cột mốc nổi bật',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Dự án được chọn để tham gia tranh tài tại hai đấu trường công nghệ lớn: IT Got Talent 2025 và Pione Dream 2025.',
                              style: TextStyle(
                                color: Colors.grey[800],
                                height: 1.6,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // 3. Phân tích Vấn đề & Giải pháp
                _buildSectionTitle('1. Bài toán đặt ra & Giải pháp'),
                _buildParagraph(
                  'Người tiêu dùng ngày càng khắt khe với nguồn gốc thực phẩm, nhưng việc theo dõi chuỗi cung ứng nông sản truyền thống lại gặp nhiều rào cản và thiếu minh bạch. Agritrace ra đời như một cầu nối số, cho phép người dùng truy xuất nguồn gốc nông sản nhanh chóng qua mã QR, đồng thời hỗ trợ người nông dân số hóa quy trình ghi chép quản lý chất lượng.',
                ),
                const SizedBox(height: 40),

                // 4. Quy trình & Công nghệ (Thể hiện sự đa năng)
                _buildSectionTitle('2. Quy trình & Tech Stack'),
                _buildParagraph(
                  'Để đảm bảo chất lượng sản phẩm trong môi trường Hackathon áp lực cao, dự án được triển khai theo quy trình Agile bài bản:',
                ),
                const SizedBox(height: 16),

                // Bullet points cho Tech Stack
                _buildBulletPoint(
                  'UI/UX Design:',
                  'Phác thảo wireframe và thiết kế giao diện tương tác trên Figma.',
                ),
                _buildBulletPoint(
                  'Quản lý dự án:',
                  'Theo dõi tiến độ, phân chia task chặt chẽ thông qua Jira.',
                ),
                _buildBulletPoint(
                  'Phát triển (Frontend):',
                  'Sử dụng Flutter để xây dựng giao diện đa nền tảng, đảm bảo hiệu năng mượt mà và animation bắt mắt.',
                ),
                _buildBulletPoint(
                  'Hệ thống & CSDL:',
                  'Tích hợp Firebase và các công cụ lưu trữ dữ liệu để xử lý truy xuất thông tin thời gian thực.',
                ),
                _buildBulletPoint(
                  'Quản lý mã nguồn:',
                  'Lưu trữ và phối hợp làm việc nhóm qua GitHub.',
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm hỗ trợ vẽ tiêu đề phần
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Hàm hỗ trợ vẽ đoạn văn bản
  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 17, height: 1.8, color: Colors.grey[800]),
    );
  }

  // Hàm hỗ trợ vẽ các gạch đầu dòng (Bullet points)
  Widget _buildBulletPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 12.0),
            child: Icon(Icons.circle, size: 8, color: Colors.blue),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
