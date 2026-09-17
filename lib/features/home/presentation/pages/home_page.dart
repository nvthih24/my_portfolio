import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/profile_provider.dart';

import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/about_me_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Lấy dữ liệu profile khi trang được xây dựng xong
      Provider.of<ProfileProvider>(context, listen: false).loadData();
    });
  }

  void _scrollToSection(int index) {
    GlobalKey key;
    // Xác định xem user muốn cuộn đến đâu
    switch (index) {
      case 0:
        key = _homeKey;
        break;
      case 1:
        key = _aboutMeKey;
        break;
      case 2:
        key = _projectsKey;
        break;
      case 3:
        key = _contactKey;
        break;
      default:
        return;
    }

    // Thực hiện hành động cuộn
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(
          milliseconds: 800,
        ), // Thời gian cuộn (0.8 giây)
        curve: Curves.easeInOut, // Hiệu ứng cuộn: Nhanh dần rồi chậm dần
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MobileDrawer(onMenuClick: _scrollToSection),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: NavBar(onMenuClick: _scrollToSection),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 2. Nội dung chính
                  Container(
                    key: _homeKey,
                    child: Consumer<ProfileProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const SizedBox(
                            height: 400,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        if (provider.profile != null) {
                          return HeroSection(profile: provider.profile!);
                        }
                        return const Text("Lỗi tải dữ liệu");
                      },
                    ),
                  ),

                  Container(key: _aboutMeKey, child: const AboutMeSection()),

                  // Gắn key Projects
                  Container(key: _projectsKey, child: const ProjectsSection()),

                  // Gắn key Contact (Footer)
                  Container(key: _contactKey, child: const FooterSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
