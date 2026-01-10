import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/profile_repository_impl.dart';
import '../../features/home/domain/repositories/profile_repository.dart';
import '../../features/home/domain/usecases/get_profile_usecase.dart';
import '../../features/home/presentation/providers/profile_provider.dart';

// sl = Service Locator (Người dẫn đường)
// Đây là biến toàn cục dùng để gọi các class ở bất cứ đâu trong app
final sl = GetIt.instance;

Future<void> init() async {
  ///! Features - Home
  sl.registerFactory(() => ProfileProvider(repository: sl()));

  // Đăng ký UseCases
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));

  // Đăng ký Repositories
  sl.registerLazySingleton<IProfileRepository>(() => ProfileRepositoryImpl());

  // Đăng ký Data Sources
  // Ví dụ: sl.registerLazySingleton<IProfileDataSource>(() => ProfileRemoteDataSource(sl()));

  ///! Core
  // Đăng ký các class dùng chung (ví dụ: NetworkInfo, InputConverter)

  ///! External
  // Đăng ký các thư viện bên ngoài (ví dụ: SharedPreferences, http client, Firebase)
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
}
