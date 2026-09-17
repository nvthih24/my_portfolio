import 'package:flutter/material.dart';

class OfflineTaskPlanner extends StatelessWidget {
  const OfflineTaskPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Offline Task Planner',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ứng dụng quản lý công việc ngoại tuyến',
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
                    border: Border.all(
                      color: Colors.orange.withValues(alpha: 0.4),
                    ),
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
                              'Ứng dụng quản lý công việc ngoại tuyến giúp người dùng tạo, theo dõi và hoàn thành các nhiệm vụ mà không cần kết nối internet. Với giao diện thân thiện và tính năng đồng bộ hóa khi có kết nối, ứng dụng này giúp nâng cao hiệu suất làm việc cá nhân.',
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
                  'Trong thời đại số hóa, nhiều người gặp khó khăn trong việc quản lý công việc khi không có kết nối internet. Ứng dụng Offline Task Planner được phát triển để giải quyết vấn đề này, cho phép người dùng tạo và quản lý nhiệm vụ một cách hiệu quả ngay cả khi ngoại tuyến. Khi có kết nối, ứng dụng sẽ tự động đồng bộ hóa dữ liệu với đám mây, đảm bảo rằng tất cả thông tin đều được cập nhật và an toàn.',
                ),
                const SizedBox(height: 40),

                // 4. Quy trình & Công nghệ (Thể hiện sự đa năng)
                _buildSectionTitle('2. Quy trình & Tech Stack'),
                _buildParagraph(
                  'Ứng dụng được phát triển theo quy trình Agile, với các bước từ phân tích yêu cầu, thiết kế giao diện, lập trình, kiểm thử và triển khai. Tech Stack bao gồm Flutter cho phát triển đa nền tảng, SQLite cho lưu trữ dữ liệu ngoại tuyến, và Firebase để đồng bộ hóa dữ liệu khi có kết nối internet.',
                ),
                const SizedBox(height: 16),

                _buildBulletPoint(
                  'Flutter:',
                  'Được sử dụng để phát triển ứng dụng đa nền tảng, giúp tiết kiệm thời gian và chi phí phát triển.',
                ),
                _buildBulletPoint(
                  'SQLite:',
                  'Được sử dụng để lưu trữ dữ liệu ngoại tuyến, đảm bảo ứng dụng hoạt động hiệu quả ngay cả khi không có kết nối internet.',
                ),
                _buildBulletPoint(
                  'Firebase:',
                  'Được sử dụng để đồng bộ hóa dữ liệu khi có kết nối internet, đảm bảo tính nhất quán và an toàn cho thông tin người dùng.',
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
