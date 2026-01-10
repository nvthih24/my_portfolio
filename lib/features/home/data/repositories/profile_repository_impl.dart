import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/entities/project_entity.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  // Tạo kết nối với Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<ProfileEntity> getProfile() async {
    try {
      // Gọi lên bảng 'profile', tìm dòng 'me'
      final docSnapshot = await firestore.collection('profile').doc('me').get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        // Lấy dữ liệu về và đổ vào Entity
        return ProfileEntity(
          name: data['name'] ?? "No Name",
          jobTitle: data['jobTitle'] ?? "",
          description: data['description'] ?? "",
          avatarUrl: data['avatarUrl'] ?? "",
        );
      } else {
        throw Exception(
          "Chưa có dữ liệu trên Firebase (Kiểm tra lại tên collection/document)",
        );
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }

  @override
  Future<List<ProjectEntity>> getProjects() async {
    try {
      // Lấy tất cả document trong collection 'projects'
      final querySnapshot = await firestore.collection('projects').get();

      // Chuyển đổi từng document thành ProjectEntity và gom thành List
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ProjectEntity(
          title: data['title'] ?? "No Title",
          description: data['description'] ?? "",
          imageUrl: data['imageUrl'] ?? "",
          gitHubLink: data['gitHubLink'],
        );
      }).toList();
    } catch (e) {
      throw Exception("Lỗi lấy Projects: $e");
    }
  }
}
