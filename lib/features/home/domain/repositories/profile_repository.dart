import '../entities/profile_entity.dart';
import '../entities/project_entity.dart';

// Interface (Abstract class)
// Đây là bản hợp đồng. Ai muốn cung cấp dữ liệu thì phải tuân theo bản này.
abstract class IProfileRepository {
  Future<ProfileEntity> getProfile();
  Future<List<ProjectEntity>> getProjects();
}
