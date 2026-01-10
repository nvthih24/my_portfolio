import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final IProfileRepository repository;

  // Tiêm (Inject) repository vào thông qua constructor
  GetProfileUseCase(this.repository);

  // Hàm call giúp class có thể được gọi như một hàm: getProfileUseCase()
  Future<ProfileEntity> call() async {
    return await repository.getProfile();
  }
}
