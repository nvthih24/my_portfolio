import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onMenuClick;

  const MobileDrawer({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Phần đầu menu
          Container(
            height: 150,
            width: double.infinity,
            color: AppColors.secondary,
            alignment: Alignment.center,
            child: const Text(
              "MENU",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Các mục menu
          _buildMenuItem(context, "Home", Icons.home, 0),
          _buildMenuItem(context, "About Me", Icons.person, 1),
          _buildMenuItem(context, "Projects", Icons.work, 2),
          _buildMenuItem(context, "Contact", Icons.email, 3),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    int index,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary),
      title: Text(title, style: AppTextStyles.body),
      onTap: () {
        // Đóng menu lại khi bấm vào
        Navigator.pop(context);
        onMenuClick(index);
      },
    );
  }
}
