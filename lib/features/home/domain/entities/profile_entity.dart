import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String name;
  final String jobTitle;
  final String description;
  final String avatarUrl;

  const ProfileEntity({
    required this.name,
    required this.jobTitle,
    required this.description,
    required this.avatarUrl,
  });

  // Equatable giúp so sánh 2 object xem có giống nhau không
  // Nếu không có nó, Dart sẽ so sánh địa chỉ bộ nhớ (luôn khác nhau)
  @override
  List<Object?> get props => [name, jobTitle, description, avatarUrl];
}
