import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/constants/app_styles.dart';

class NavBar extends StatelessWidget {
  final Function(int) onMenuClick;

  const NavBar({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    // Kiểm tra xem đang ở Mobile hay Desktop
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => onMenuClick(0),
            child: Text(
              "MY PORTFOLIO",
              style: AppTextStyles.jobTitle.copyWith(fontSize: 24),
            ),
          ),

          // Menu items (Chỉ hiện trên Tablet/Desktop, Mobile sẽ dùng icon menu sau)
          if (!isMobile)
            Row(
              children: [
                _buildMenuItem("Home", 0),
                const SizedBox(width: 30),
                _buildMenuItem("Projects", 1),
                const SizedBox(width: 30),
                _buildMenuItem("Contact", 2),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, size: 30),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, int index) {
    return InkWell(
      onTap: () => onMenuClick(index), // Báo ra ngoài là tao vừa bấm nút số mấy
      child: Text(
        title,
        style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
