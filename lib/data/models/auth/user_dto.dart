import 'package:freezed_annotation/freezed_annotation.dart';
import 'role_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String username,
    String? name,
    required List<RoleDto> roles,
    String? phoneNumber,
    String? avatar,
    required bool onboardingCompleted,
    required bool isOAuthAccount,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
