import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../domain/entities/project_entity.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias, // Cắt ảnh tràn viền bo tròn
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Ảnh dự án (Giữ tỷ lệ khung hình 16:9)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
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

              // 2. Nội dung
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title, style: AppTextStyles.jobTitle),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: AppTextStyles.body.copyWith(fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis, // Cắt bớt nếu dài quá
                    ),
                    const SizedBox(height: 16),

                    // Nút xem chi tiết / Github
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {
                          // Logic mở link: launchUrl(Uri.parse(project.gitHubLink!));
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
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0, curve: Curves.easeOut);
  }
}
