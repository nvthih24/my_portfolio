import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../domain/entities/project_entity.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../pages/agritrace_case_study_page.dart';
import '../pages/offline_task_planner.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Phần Ảnh: Bọc Expanded để nó tự động lấp đầy không gian CÒN LẠI
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[100], // Nền xám nhạt tôn thiết kế app
              padding: const EdgeInsets.all(20),
              child: Image.network(
                project.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
          ),

          // 2. Phần Nội dung: Bỏ Expanded đi, cho nó tự quyết định chiều cao
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:
                  MainAxisSize.min, // Khóa chiều cao vừa khít nội dung
              children: [
                Text(
                  project.title,
                  style: AppTextStyles.jobTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: AppTextStyles.body.copyWith(fontSize: 14),
                  maxLines: 2, // Khống chế 2 dòng để các thẻ cao bằng nhau
                  overflow:
                      TextOverflow.ellipsis, // Nếu dài quá tự hiện dấu 3 chấm
                ),
                const SizedBox(height: 12), // Tạo khoảng thở với nút bấm
                // Nút xem chi tiết
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      if (project.title.toLowerCase().contains('agritrace')) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AgritraceCaseStudyPage(),
                          ),
                        );
                      } else {
                        // Logic mở link: launchUrl(Uri.parse(project.gitHubLink!));
                      }

                      if (project.title.toLowerCase().contains(
                        'offline task planner',
                      )) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OfflineTaskPlanner(),
                          ),
                        );
                      } else {
                        // Logic mở link: launchUrl(Uri.parse(project.gitHubLink!));
                      }
                    },
                    icon: const Icon(Icons.arrow_forward, size: 16),
                    label: const Text("View Project"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut);
  }
}
