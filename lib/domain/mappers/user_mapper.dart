import 'package:tripnester/data/models/auth/user_dto.dart';
import 'package:tripnester/domain/entities/user.dart';

extension UserMapper on UserDto {
  AppUser toDomain() {
    return AppUser(
      id: id,
      email: username, // backend uses "username" to carry the email
      name: name ?? '', // Ensure name is not null since it's required in domain
      phoneNumber: phoneNumber,
      avatar: avatar,
      onboardingCompleted: onboardingCompleted,
      isOAuthAccount: isOAuthAccount,
      roles: roles.map((r) => r.role).toList(),
    );
  }
}
