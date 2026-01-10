import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/domain/entities/project_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final IProfileRepository repository;

  ProfileEntity? profile;
  List<ProjectEntity> projects = [];
  bool isLoading = true;
  ProfileProvider({required this.repository});

  Future<void> loadData() async {
    // Đổi tên hàm loadProfile thành loadData cho đúng nghĩa
    isLoading = true;
    notifyListeners();

    try {
      // Chạy song song cả 2 việc: Lấy Profile và Lấy Projects
      final results = await Future.wait([
        repository.getProfile(),
        repository.getProjects(),
      ]);

      // Gán kết quả
      profile = results[0] as ProfileEntity;
      projects = results[1] as List<ProjectEntity>;
    } catch (e) {
      debugPrint("Lỗi tải dữ liệu: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
