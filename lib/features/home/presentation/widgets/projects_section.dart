import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../providers/profile_provider.dart'; // Import file Provider
import 'project_card.dart';
import '../../../../core/constants/app_styles.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy danh sách dự án từ Provider
    final projects = Provider.of<ProfileProvider>(context).projects;

    if (projects.isEmpty) {
      return const SizedBox(); // Nếu chưa có dự án thì ẩn đi
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      width: double.infinity,
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            "Featured Projects",
            style: AppTextStyles.h1.copyWith(fontSize: 32),
          ),
          const SizedBox(height: 40),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 3;
              double width = constraints.maxWidth;
              if (width < 600)
                crossAxisCount = 1;
              else if (width < 1100)
                crossAxisCount = 2;

              double childAspectRatio = width < 600 ? 0.85 : 0.75;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length, // Dùng số lượng thật
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(
                    project: projects[index],
                  ); // Truyền dự án thật
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
